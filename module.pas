uses GraphABC, fractal;
var y1,x1,n:integer;
procedure text;
begin
  textout(10, 100, 'Up-Вверх');
  textout(10, 120, 'Down-Вниз');
  textout(10, 140, 'Left-Влево');
  textout(10, 160, 'Right-Вправо');
  textout(10, 180, 'W-Увеличение масштаба');
  textout(10, 200, 'S-Уменьшение масштаба');
  textout(10, 220, 'D-Увеличение фрактала(+ 1)');
  textout(10, 240, 'A-Уменьшение фрактала(- 1)');
end;
procedure KeyDown(key: integer);
begin
  x := windowwidth div 2;
  y := windowheight div 2;
  case key of
    VK_Up: begin y1 := y1 - 50; end;    //Вверх
    VK_Down: begin y1 += 50; end;       //Вниз
    VK_Left: begin x1 := x1 - 50; end;  //Влево
    VK_Right: begin x1 := x1 + 50; end; //Вправо
    VK_S: if n>1 then n -= 1;           //Уменьшить фрактал
    VK_W: n += 1;                       //Увеличить фрактал
    VK_A: if h>5 then h -= 5;           //Уменьшить масштаб
    VK_D: h += 5;                       //Увеличить масштаб
  end;
  x := x + x1;
  y := y + y1;
  clearwindow;
  text;
  moveto(x, y);
  PL(n);
  redraw;
end;
begin
  SetWindowSize(800, 500);
  SetWindowCaption('Кривая Пеано');
  SetPenColor(clred);
  text;
  x := windowwidth div 2;
  y := windowheight div 2;
  n := 5;
  h:=5;
  moveto(x, y);
  PL(n);
  redraw;
  onKeyDown += keydown;
end.
