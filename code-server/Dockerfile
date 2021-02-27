FROM mykiwi/devbox

RUN curl -fsSL https://code-server.dev/install.sh | sh

RUN set -xe \
 # PHP
 && code-server --install-extension=felixfbecker.php-debug \
 && code-server --install-extension=felixfbecker.php-intellisense \
 && code-server --install-extension=felixfbecker.php-pack \
 # Go
 && code-server --install-extension=golang.go \
 # Docker
 && code-server --install-extension=ms-azuretools.vscode-docker \
 # Python
 && code-server --install-extension=ms-python.python \
 # Terraform
 && code-server --install-extension=mauve.terraform \
 # YAML
 && code-server --install-extension=redhat.vscode-yaml \
 # Rust
 && code-server --install-extension=rust-lang.rust \
 # JS
 && code-server --install-extension=dbaeumer.vscode-eslint \
 # CSS / SASSS
 && code-server --install-extension=robinbentley.sass-indented \
 && code-server --install-extension=zignd.html-css-class-completion

CMD ["code-server", "--bind-addr=0.0.0.0:80", "--disable-telemetry"]

ENV SHELL /bin/zsh
