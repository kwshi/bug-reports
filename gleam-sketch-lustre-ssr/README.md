## instructions

(you can also use `docker` instead of `podman`; you may need to rename `Containerfile` to `Dockerfile` in that case)

- `podman build -t sketch-bug .`
- `podman run --interactive --tty --rm sketch-bug <MODE>` where `<MODE>` is one of:
  - `vanilla` renders a plain `lustre` document without `sketch`
  - `sketch-ssr` renders elements using `sketch/lustre/element/html` wrapped with `sketch/lustre.ssr`
  - `sketch-manual` renders elements using `sketch/lustre/element/html` wrapped with `sketch/lustre.render`
  - `mix-ssr` renders elements using plain `lustre/element/html` wrapped in `sketch/lustre.ssr`
  - `mix-manual` renders elements using plain `lustre/element/html` wrapped with `sketch/lustre.render`
