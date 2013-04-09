#include <cairo.h>

typedef enum {
  red, green, blue, yellow, purple, cyan, white, black, gray
} color;

typedef struct {
  int width;
  int height;
  int patch_size;
  cairo_surface_t *surface;
  cairo_t *cr;
} image_info;

void test(void);
image_info* init(int width, int height, int patch_size);
void cleanup(image_info *info);
void begin(image_info *info);
void end(char *png_filename, image_info *info);
void draw_patch(int x, int y, color c, image_info *info);
void draw_turtle(float x, float y, float r, color c, image_info *info);
