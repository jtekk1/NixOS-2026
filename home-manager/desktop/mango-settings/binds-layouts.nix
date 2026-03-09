{ ... }:

{
  wayland.windowManager.mango.settings = ''
    # Layout control
    bind=SUPER+ALT,n,switch_layout,

    # Layouts
    bind=SUPER+CTRL,t,spawn,layout-notify tiling
    bind=SUPER+CTRL,x,spawn,layout-notify tgmix
    bind=SUPER+CTRL,s,spawn,layout-notify scrolling
    bind=SUPER+CTRL,m,spawn,layout-notify monocle
    bind=SUPER+CTRL,g,spawn,layout-notify grid
    bind=SUPER+CTRL,d,spawn,layout-notify deck
    bind=SUPER+CTRL,c,spawn,layout-notify centerTiling
    bind=SUPER+CTRL,e,spawn,layout-notify verticalScrolling
    bind=SUPER+CTRL,v,spawn,layout-notify verticalTiling

    # Master/stack control
    bind=SUPER+ALT,e,incnmaster,1
    bind=SUPER+ALT,t,incnmaster,-1
    bind=SUPER+ALT,h,setmfact,-0.05
    bind=SUPER+ALT,l,setmfact,+0.05

    # Proportion control (SCROLLER)
    bind=SUPER+SHIFT,e,set_proportion,0.33
    bind=SUPER+ALT,x,switch_proportion_preset,

    # Scroller Stacking
    bind=SUPER+ALT,Left,scroller_stack,left
    bind=SUPER+ALT,Up,scroller_stack,up
    bind=SUPER+ALT,Down,scroller_stack,down
    bind=SUPER+ALT,Right,scroller_stack,right
  '';
}
