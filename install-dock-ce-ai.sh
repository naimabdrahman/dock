#!/usr/bin/env bash
set -euo pipefail

# Install Docker CE + Docker Compose (v2) on AlmaLinux/CentOS 8/9
# - Uses docker official repo for centos (works for Alma/RHEL derivatives too)
# - Installs compose as docker CLI plugin: `docker compose`
# - Optional wrapper for legacy `docker-compose` command

if [[ $EUID -ne 0 ]]; then
  echo "Please run as root (or sudo)." >&2
  exit 1
fi

echo "[INFO] Detecting OS..."
if [[ -r /etc/os-release ]]; then
  . /etc/os-release
else
  echo "[ERROR] Cannot read /etc/os-release" >&2
  exit 1
fi

OS_ID="${ID:-unknown}"
OS_VER="${VERSION_ID:-0}"
MAJOR="${OS_VER%%.*}"

if [[ "$MAJOR" != "8" && "$MAJOR" != "9" ]]; then
  echo "[ERROR] Unsupported major version: $OS_VER (need 8 or 9)" >&2
  exit 1
fi

case "$OS_ID" in
  almalinux|centos|rhel|rocky)
    echo "[INFO] OS: $OS_ID $OS_VER"
    ;;
  *)
    echo "[WARN] OS ID '$OS_ID' not explicitly tested. Continuing anyway (RHEL-like expected)."
    ;;
esac

echo "[INFO] Installing dependencies..."
dnf -y install dnf-plugins-core ca-certificates curl

# Remove conflicting older packages if present (safe even if not installed)
echo "[INFO] Removing old/conflicting docker packages if any..."
dnf -y remove \
  docker docker-client docker-client-latest docker-common docker-latest \
  docker-latest-logrotate docker-logrotate docker-engine podman-docker \
  || true

echo "[INFO] Adding Docker CE repo..."
dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

echo "[INFO] Installing Docker CE + plugins..."
dnf -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "[INFO] Enabling and starting docker..."
systemctl enable --now docker

# Optional: allow current (invoking) user to run docker without sudo
# If script is run with sudo, SUDO_USER will be the original user.
TARGET_USER="${SUDO_USER:-}"
if [[ -n "$TARGET_USER" && "$TARGET_USER" != "root" ]]; then
  echo "[INFO] Adding user '$TARGET_USER' to docker group..."
  groupadd -f docker
  usermod -aG docker "$TARGET_USER" || true
  echo "[INFO] NOTE: '$TARGET_USER' needs to log out/in for docker group to apply."
fi

# Create legacy wrapper if you want `docker-compose` command still usable
WRAPPER="/usr/local/bin/docker-compose"
if [[ ! -e "$WRAPPER" ]]; then
  echo "[INFO] Creating legacy docker-compose wrapper at $WRAPPER ..."
  cat > "$WRAPPER" <<'EOF'
#!/usr/bin/env bash
exec docker compose "$@"
EOF
  chmod +x "$WRAPPER"
fi

echo
echo "[OK] Installed:"
docker --version || true
docker compose version || true
if command -v docker-compose >/dev/null 2>&1; then
  docker-compose --version || true
fi

echo
echo "[DONE] Try:"
echo "  docker run --rm hello-world"
echo "  docker compose version"
