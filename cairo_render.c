#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include "cairo_render.h"

image_info* init(int width, int height, int patch_size) {
  int w = width * patch_size;
  int h = height * patch_size;
  image_info *info = (image_info *)malloc(sizeof(image_info));
  info->width = width;
  info->height = height;
  info->patch_size = patch_size;
  info->surface = cairo_image_surface_create(CAIRO_FORMAT_ARGB32, w, h);
  info->cr = NULL;
  return info;
}

void cleanup(image_info *info) {
  if(info->cr != NULL) {
    cairo_destroy(info->cr);
  }
  cairo_surface_destroy(info->surface);
  free(info);
}

void begin(image_info *info) {
  info->cr = cairo_create(info->surface);
}

void end(char *png_filename, image_info *info) {
  cairo_surface_write_to_png(info->surface, png_filename);
  cairo_destroy(info->cr);
  info->cr = NULL;
}

void set_color(color c, image_info *info) {
  switch(c) {
    case red:
      cairo_set_source_rgb(info->cr, 1.0, 0.0, 0.0);
      break;
    case green:
      cairo_set_source_rgb(info->cr, 0.0, 1.0, 0.0);
      break;
    case blue:
      cairo_set_source_rgb(info->cr, 0.0, 0.0, 1.0);
      break;
    case yellow:
      cairo_set_source_rgb(info->cr, 1.0, 1.0, 0.0);
      break;
    case purple:
      cairo_set_source_rgb(info->cr, 1.0, 0.0, 1.0);
      break;
    case cyan: 
      cairo_set_source_rgb(info->cr, 0.0, 1.0, 1.0);
      break;
    case white:
      cairo_set_source_rgb(info->cr, 1.0, 1.0, 1.0);
      break;
    case black: 
      cairo_set_source_rgb(info->cr, 0.0, 0.0, 0.0);
      break;
    case gray:
    default:
      cairo_set_source_rgb(info->cr, 0.5, 0.5, 0.5);
      break;
  }
}

void draw_patch(int x, int y, color c, image_info *info) {
  int p = info->patch_size;
  set_color(c, info);
  cairo_identity_matrix(info->cr);
  cairo_scale(info->cr, p, p);
  cairo_rectangle(info->cr, x, y, 1.0, 1.0);
  cairo_fill(info->cr);
}

void draw_turtle(float x, float y, float r, color c, image_info *info) {
  int p = info->patch_size;
  set_color(c, info);
  cairo_identity_matrix(info->cr);
  cairo_scale(info->cr, p, p);
  cairo_translate(info->cr, x + 0.5, y + 0.5);
  cairo_rotate(info->cr, r);
  cairo_move_to(info->cr, 0.5, 0.0);
  cairo_line_to(info->cr, -0.5, -0.5);
  cairo_line_to(info->cr, -0.5,  0.5);
  cairo_fill(info->cr);
}
