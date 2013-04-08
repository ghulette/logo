#include <cairo.h>

int main(void) {
  cairo_surface_t *surface;
  cairo_t *cr;

  surface = cairo_image_surface_create(CAIRO_FORMAT_ARGB32, 500, 500);
  cr = cairo_create(surface);

  cairo_set_source_rgb(cr, 1.0, 1.0, 1.0);
  cairo_paint(cr);

  cairo_set_source_rgb(cr, 0, 0, 0);
  cairo_set_line_width(cr, 1.0);

  cairo_move_to(cr, 0.0, 0.0);
  cairo_line_to(cr, 490.0, 490.0);

  cairo_stroke(cr);
  cairo_surface_write_to_png(surface, "image.png");

  cairo_destroy(cr);
  cairo_surface_destroy(surface);

  return 0;
}
