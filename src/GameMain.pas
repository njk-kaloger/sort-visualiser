program GameMain;
uses SwinGame, SysUtils, TerminalUserInput;

type data = Array of Integer;

function PopulateArray(dataArray: data): data;
var i: Integer;
begin
	for i := 0 to High(dataArray) do
	begin
		dataArray[i] := Rnd(ScreenHeight());
	end;
	result := dataArray;
end;

procedure PlotBars(dataArray: data);
var i: Integer;
var xPosition, yPosition, GraphHeight, GraphWidth: Integer;
begin
	for i := 0 to High(dataArray) do 
	begin
		GraphWidth := Round(PanelWidth( 'NumberPanel' )/7);
		xPosition := (GraphWidth*i);
		GraphHeight := dataArray[i];
		yPosition := (ScreenHeight() - dataArray[i]);
		FillRectangle(ColorRed, xPosition, yPosition, GraphWidth, GraphHeight);
		DrawInterface();
  		RefreshScreen(60);
		delay(100);
	end;
end;

procedure Swap(var v1, v2: Integer);
var temp: Integer;
begin
   temp := v1;
   v1 := v2;
   v2 := temp;
end;


procedure Sort(dataArray: data);
var i, j: Integer;
begin
	for i := High(dataArray) downto Low(dataArray) do
	begin
		for j := Low(dataArray) to i - 1 do
		begin
			if dataArray[j] > dataArray[j + 1] then
			begin
				Swap(dataArray[j], dataArray[j + 1]);
			end;
		end;
	end;
end;

procedure ShowNumbersInList(dataArray: data);
var i: Integer;
begin
	ListClearItems( 'NumbersList' );
	for i := 0 to High(dataArray) do
	begin
		ListAddItem( 'NumbersList', IntToStr(dataArray[i]));
	end;
end;


procedure DoSort();
var data: Array of Integer; 
i: Integer;
begin
	SetLength(data, 20);
	data := PopulateArray(data);
	Sort(data);
	PlotBars(data);
	ShowNumbersInList(data);
end;

procedure Main();
begin
  OpenGraphicsWindow('Sort Visualiser', 800, 600);
  
  LoadResourceBundle( 'NumberBundle.txt' );
  
  GUISetForegroundColor( ColorBlack );
  GUISetBackgroundColor( ColorWhite );
  
  ShowPanel( 'NumberPanel' );
  
  ClearScreen(ColorWhite);
  
  repeat
  	ProcessEvents();
  	UpdateInterface();

  	DrawInterface();
  	RefreshScreen(60);

  	if ButtonClicked( 'SortButton' ) then
  	begin
  		RefreshScreen(60);
  		DoSort();
  	end;
  until WindowCloseRequested();
end;

begin
	Main();
end.
