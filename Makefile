SOURCES = agent.ml store.mli store.ml patch.ml turtle.ml world.ml main.ml
RESULT  = maml

all: native-code

include OCamlMakefile
