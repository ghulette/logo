#include <stdio.h>
#include <caml/mlvalues.h>
#include "cairo_render.h"

CAMLprim value
caml_test(value unit) {
  test();
  return Val_unit;
}
