#include <stdio.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include "cairo_render.h"

CAMLprim value
caml_init(value width, value height, value patch_size) {
  image_info *inf;
  int w = Int_val(width);
  int h = Int_val(height);
  int p = Int_val(patch_size);
  inf = init(w,h,p);
  return (value) inf;
}

CAMLprim value
caml_cleanup(value info) {
  image_info *inf = (image_info *)info;
  cleanup(inf);
  return Val_unit;
}

CAMLprim value
caml_begin_draw(value info) {
  image_info *inf = (image_info *)info;
  begin(inf);
  return Val_unit;
}

CAMLprim value
caml_end_draw(value filename, value info) {
  image_info *inf = (image_info *)info;
  char *s = String_val(filename);
  end(s, inf);
  return Val_unit;
}

CAMLprim value
caml_draw_patch(value ml_x, value ml_y, value ml_color, value info) {
  image_info *inf = (image_info *)info;
  int x = Int_val(ml_x);
  int y = Int_val(ml_y);
  int color = Int_val(ml_color);
  draw_patch(x, y, color, inf);
  return Val_unit;
}

CAMLprim value
caml_draw_turtle(value ml_x, value ml_y, value ml_r, value ml_color, value info) {
  image_info *inf = (image_info *)info;
  float x = Double_val(ml_x);
  float y = Double_val(ml_y);
  float r = Double_val(ml_r);
  int color = Int_val(ml_color);
  draw_turtle(x, y, r, color, inf);
  return Val_unit;
}

