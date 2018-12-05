#!/usr/bin/env python

# GIMP Python plug-in template.

from gimpfu import *

def do_stuff(image) :
    layer = pdb.gimp_image_get_active_layer(image)
    gimp.progress_init("Grow/Feather/Cut on " + layer.name + "...")

    # Set up an undo group, so the operation will be undone in one step.
    pdb.gimp_undo_push_group_start(image)

    pdb.gimp_layer_add_alpha(layer)
    pdb.gimp_selection_grow(image, 2)
    pdb.gimp_selection_feather(image, 5)
    pdb.gimp_edit_clear(layer)
    pdb.gimp_selection_clear(image)

    # Close the undo group.
    pdb.gimp_undo_push_group_end(image)

register(
    "python_fu_do_stuff",
    "Grow/Feather/Cut",
    "Longer description of doing stuff",
    "Joe Francis",
    "Joe Francis",
    "2018",
    "Grow/Feather/Cut",
    "*",      # Alternately use RGB, RGB*, GRAY*, INDEXED etc.
    [
     (PF_IMAGE, "img", "takes current image", None)
    ],
    [],
    do_stuff,
    menu="<Image>/Filters")

main()
