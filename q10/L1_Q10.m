% DTFT
close all
clear

%------------------------------------------------------------
% implementação de algoritmo para  a DTFT

function [X,W] = dtft(x)
  fs = 8000;
  W = [-fs/2:1:fs/2]*pi*2/(fs); %eixo de freq. em pi
  X=0;
  N=size(x,2)-1;
  for n =0:N
    X += (x(1,n+1)*exp(-j*W*n));
  endfor
  X = abs(X)
 endfunction

%-----------------------------------
% valores de input
beta = 0.6035;
alpha1 = -0.05175;
alpha2 = 0.25;
h.sistema = [alpha1 alpha2 beta alpha2 alpha1 0 0 0]
h.ax = axes ("position", [0.05 0.42 0.5 0.5]);
h.fcn = @(x) dtft(x);

function update_plot (obj, init = false)

  ## gcbo holds the handle of the control
  h = guidata (obj);
  replot = false;
  recalc = false;
  switch (gcbo)
    case {h.print_pushbutton}
      fn =  uiputfile ("*.png");
      print (fn);
    case {h.grid_checkbox}
      v = get (gcbo, "value");
      grid (merge (v, "on", "off"));
    case {h.minor_grid_toggle}
      v = get (gcbo, "value");
      grid ("minor", merge (v, "on", "off"));
   
   case {h.x0}
      [valor, conversaoEValida] = str2num(get (gcbo, "string"))
      if(conversaoEValida) 
        set (get (h.ax, "title"), "string", "");
        recalc = true
        h.sistema(1,1) = valor
      else 
        set (get (h.ax, "title"), "string", "valor incorreto para x[0]");
      endif
    case {h.x1}
      [valor, conversaoEValida] = str2num(get (gcbo, "string"))
      if(conversaoEValida) 
        set (get (h.ax, "title"), "string", "");
        recalc = true
        h.sistema(1,2) = valor
      else 
        set (get (h.ax, "title"), "string", "valor incorreto para x[1]");
      endif
    case {h.x2}
      [valor,conversaoEValida] = str2num(get (gcbo, "string"))
      if(conversaoEValida) 
        set (get (h.ax, "title"), "string", "");
        recalc = true
        h.sistema(1,3) = valor
      else 
        set (get (h.ax, "title"), "string", "valor incorreto para x[2]");
      endif
    case {h.x3}
        [valor,conversaoEValida] = str2num(get (gcbo, "string"))
        if(conversaoEValida) 
          set (get (h.ax, "title"), "string", "");
          recalc = true
          h.sistema(1,4) = valor
        else 
          set (get (h.ax, "title"), "string", "valor incorreto para x[3]");
        endif
    case {h.x4}
      [valor, conversaoEValida] = str2num(get (gcbo, "string"))
      if(conversaoEValida) 
        set (get (h.ax, "title"), "string", "");
        recalc = true
        h.sistema(1,5) = valor
      else 
        set (get (h.ax, "title"), "string", "valor incorreto para x[4]");
      endif
    case {h.x5}
      [valor, conversaoEValida] = str2num(get (gcbo, "string"))
      if(conversaoEValida) 
        set (get (h.ax, "title"), "string", "");
        recalc = true
        h.sistema(1,6) = valor
      else 
        set (get (h.ax, "title"), "string", "valor incorreto para x[5]");
      endif
    case {h.x6}
      [valor,conversaoEValida] = str2num(get (gcbo, "string"))
      if(conversaoEValida) 
        set (get (h.ax, "title"), "string", "");
        recalc = true
        h.sistema(1,7) = valor
      else 
        set (get (h.ax, "title"), "string", "valor incorreto para x[6]");
      endif
    case {h.x7}
        [valor,conversaoEValida] = str2num(get (gcbo, "string"))
        if(conversaoEValida) 
          set (get (h.ax, "title"), "string", "");
          recalc = true
          h.sistema(1,8) = valor
        else 
          set (get (h.ax, "title"), "string", "valor incorreto para x[7]");
        endif
    case {h.linecolor_radio_blue}
      set (h.linecolor_radio_red, "value", 0);
      replot = true;
    case {h.linecolor_radio_red}
      set (h.linecolor_radio_blue, "value", 0);
      replot = true;
    case {h.linestyle_popup, h.markerstyle_list}
      replot = true;

  endswitch

  if (recalc || init)
    [y,w] = h.fcn (h.sistema);
    x = (w/pi);
    if (init)
      h.plot = plot (x, y, "b");
      
    else
      set (h.plot, "ydata", y);
    endif
    
    guidata (obj, h);
  endif

  if (replot)
    cb_red = get (h.linecolor_radio_red, "value");
    lstyle = get (h.linestyle_popup, "string"){get (h.linestyle_popup, "value")};
    lstyle = strtrim (lstyle(1:2));

    mstyle = get (h.markerstyle_list, "string"){get (h.markerstyle_list, "value")};
    if (strfind (mstyle, "none"))
      mstyle = "none";
    else
      mstyle = mstyle(2);
    endif
  
    set (h.plot, "color", merge (cb_red, [1 0 0 ], [0 0 1]),
                 "linestyle", lstyle,
                 "marker", mstyle);
  endif
  
endfunction


## plot title
h.plot_title_label = uicontrol ("style", "text",
                                "units", "normalized",
                                "string", "Valores do Sistema",
                                "horizontalalignment", "left",
                                "position", [0.6 0.85 0.35 0.08]);

h.x0 = uicontrol ("style", "edit",
                               "units", "normalized",
                               "string", "x[0]",
                               "callback", @update_plot,
                               "position", [0.6 0.8 0.08 0.06]);

h.x1 = uicontrol ("style", "edit",
                               "units", "normalized",
                               "string", "x[1]",
                               "callback", @update_plot,
                               "position", [0.69 0.80 0.08 0.06]);
 
h.x2= uicontrol ("style", "edit",
                               "units", "normalized",
                               "string", "x[2]",
                               "callback", @update_plot,
                               "position", [0.78 0.80 0.08 0.06]);
                               
h.x3= uicontrol ("style", "edit",
                               "units", "normalized",
                               "string", "x[3]",
                               "callback", @update_plot,
                               "position", [0.87 0.80 0.08 0.06]);
h.x4 = uicontrol ("style", "edit",
                               "units", "normalized",
                               "string", "x[4]",
                               "callback", @update_plot,
                               "position", [0.6 0.70 0.08 0.06]);

h.x5 = uicontrol ("style", "edit",
                               "units", "normalized",
                               "string", "x[5]",
                               "callback", @update_plot,
                               "position", [0.69 0.70 0.08 0.06]);
 
h.x6= uicontrol ("style", "edit",
                               "units", "normalized",
                               "string", "x[6]",
                               "callback", @update_plot,
                               "position", [0.78 0.70 0.08 0.06]);
                               
h.x7= uicontrol ("style", "edit",
                               "units", "normalized",
                               "string", "x[7]",
                               "callback", @update_plot,
                               "position", [0.87 0.70 0.08 0.06]);                              
## grid
h.grid_checkbox = uicontrol ("style", "checkbox",
                             "units", "normalized",
                             "string", "mostrar grid",
                             "value", 0,
                             "callback", @update_plot,
                             "position", [0.05 0.20 0.35 0.09]);

h.minor_grid_toggle = uicontrol ("style", "togglebutton",
                                 "units", "normalized",
                                 "string", "mostrar grid menor",
                                 "callback", @update_plot,
                                 "value", 0,
                                 "position", [0.25 0.2 0.25 0.09]);

## print figure
h.print_pushbutton = uicontrol ("style", "pushbutton",
                                "units", "normalized",
                                "string", "salvar imagem",
                                "callback", @update_plot,
                                "position", [0.6 0.45 0.35 0.09]);


## linecolor
h.linecolor_label = uicontrol ("style", "text",
                               "units", "normalized",
                               "string", "Cor da linha:",
                               "horizontalalignment", "left",
                               "position", [0.05 0.12 0.35 0.08]);

h.linecolor_radio_blue = uicontrol ("style", "radiobutton",
                                    "units", "normalized",
                                    "string", "azul",
                                    "callback", @update_plot,
                                    "position", [0.05 0.08 0.15 0.04]);

h.linecolor_radio_red = uicontrol ("style", "radiobutton",
                                   "units", "normalized",
                                   "string", "vermelho",
                                   "callback", @update_plot,
                                   "value", 0,
                                   "position", [0.05 0.02 0.15 0.04]);

## linestyle
h.linestyle_label = uicontrol ("style", "text",
                               "units", "normalized",
                               "string", "estilo da linha:",
                               "horizontalalignment", "left",
                               "position", [0.25 0.12 0.35 0.08]);

h.linestyle_popup = uicontrol ("style", "popupmenu",
                               "units", "normalized",
                               "string", {"-  linha solida",
                                          "-- linha tracejada",
                                          ":  linha pontilhada"},
                               "callback", @update_plot,
                               "position", [0.25 0.05 0.3 0.06]);

## markerstyle
h.markerstyle_label = uicontrol ("style", "text",
                                 "units", "normalized",
                                 "string", "estilo de marcacao:",
                                 "horizontalalignment", "left",
                                 "position", [0.58 0.3 0.35 0.08]);

h.markerstyle_list = uicontrol ("style", "listbox",
                                "units", "normalized",
                                "string", {"none",
                                           "'+' cruz",
                                           "'o'  circulo",
                                           "'*'  estrela",
                                           "'.'  ponto",
                                           "'x'  xis",
                                           "'s'  quadrado",
                                           "'d'  diamante",
                                           "'^'  triangulo superior",
                                           "'v'  triangulo inferior",
                                           "'>'  triangulo direita",
                                           "'<'  triangulo esquerda",
                                           "'p'  porcentagem",
                                           "'h'  hexagrama"},
                                "callback", @update_plot,
                                "position", [0.58 0.04 0.38 0.26]);

set (gcf, "color", get(0, "defaultuicontrolbackgroundcolor"))
guidata (gcf, h)
update_plot (gcf, true);