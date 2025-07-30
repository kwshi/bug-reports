import argv
import gleam/io

import lustre/element
import lustre/element/html

import sketch
import sketch/css
import sketch/lustre as sketch_lustre
import sketch/lustre/element/html as sketch_html

fn render_vanilla() {
  html.html([], [
    html.head([], [html.title([], "hello lustre")]),
    html.body([], [html.text("foo bar")]),
  ])
}

fn render_sketch_ssr() {
  use <- sketch_lustre.ssr()
  sketch_html.html([], [
    sketch_html.head([], [sketch_html.title([], "hello lustre")]),
    sketch_html.body(css.class([css.color("red")]), [], [
      sketch_html.text("foo bar"),
    ]),
  ])
}

fn render_sketch_manual(stylesheet: sketch.StyleSheet) {
  use <- sketch_lustre.render(stylesheet, [sketch_lustre.node()])
  sketch_html.html([], [
    sketch_html.head([], [sketch_html.title([], "hello lustre")]),
    sketch_html.body(css.class([css.color("red")]), [], [
      sketch_html.text("foo bar"),
    ]),
  ])
}

fn render_mix_ssr() {
  use <- sketch_lustre.ssr()
  render_vanilla()
}

fn render_mix_manual(stylesheet: sketch.StyleSheet) {
  use <- sketch_lustre.render(stylesheet, [sketch_lustre.node()])
  render_vanilla()
}

fn render(stylesheet: sketch.StyleSheet) {
  case argv.load().arguments {
    ["vanilla"] -> render_vanilla()
    ["sketch-ssr"] -> render_sketch_ssr()
    ["sketch-manual"] -> render_sketch_manual(stylesheet)
    ["mix-ssr"] -> render_mix_ssr()
    ["mix-manual"] -> render_mix_manual(stylesheet)
    _ ->
      panic as "invalid case: run with one of `vanilla`, `sketch-ssr`, `sketch-manual`, `mix-ssr`, `mix-manual`"
  }
}

pub fn main() {
  let assert Ok(stylesheet) = sketch_lustre.setup()

  render(stylesheet)
  |> element.to_document_string
  |> io.println
}
