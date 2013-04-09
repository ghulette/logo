SOURCES = util.mli util.ml \
          array2d.mli array2d.ml \
          store.mli store.ml \
          patch.mli patch.ml \
          turtle.mli turtle.ml \
          cairo_render.c render_stubs.c render.ml \
          world.mli world.ml \
          main.ml
CLIBS   = cairo
RESULT  = maml

all: native-code

include OCamlMakefile
