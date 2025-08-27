#!/bin/bash
set -eux

# Update system
apt-get update -y
apt-get upgrade -y

# Install nginx
apt-get install -y nginx

# Enable and start nginx
systemctl enable nginx
systemctl start nginx

# Replace default index.html with a custom one
cat >/var/www/html/index.html <<'HTML'
<!doctype html><html><head>
<meta charset="utf-8">
<title>Mukesh | Codesentinel</title>
<style>
  body { font-family: system-ui, Arial; margin: 40px; background: #f9f9f9; }
  h1 { color: #4F46E5; }
  code { background: #f4f4f4; padding: 2px 6px; border-radius: 6px }
</style>
</head><body>
  <h1>Portfolio containerized & deployed</h1>
  <p>Nginx installed via <code>Terraform user_data</code> script file on Ubuntu.</p>
</body></html>
HTML

