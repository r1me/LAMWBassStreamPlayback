{Hint: save all files to location: F:\LAMW\Projects\BassStreamPlayback\jni }
unit unit1;

{$mode delphi}

interface

uses
  cthreads, Classes, SysUtils, AndroidWidget, Laz_And_Controls, bass;
  
type

  { TAndroidModule1 }

  TAndroidModule1 = class(jForm)
    btnPlay1: jButton;
    btnPlay2: jButton;
    btnStop: jButton;
    jPanel1: jPanel;
    labStatus: jTextView;
    procedure AndroidModule1Close(Sender: TObject);
    procedure AndroidModule1JNIPrompt(Sender: TObject);
    procedure btnPlay1Click(Sender: TObject);
    procedure btnPlay2Click(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
  private
    {private declarations}
    FChan: HSTREAM;
  public
    {public declarations}
    procedure PlayStream(AStreamURL: String);
    function InitBass: Boolean;
    procedure FreeBass;
  end;

var
  AndroidModule1: TAndroidModule1;

implementation

{$R *.lfm}

const
  urls: array[0..1] of AnsiString = (
	'http://icecast8.play.cz/cro1-128.mp3',
        'http://icecast6.play.cz/cro2-128.mp3'
    );

{ TAndroidModule1 }

procedure TAndroidModule1.AndroidModule1JNIPrompt(Sender: TObject);
begin
  FChan := 0;
  if not InitBass then
  begin
    ShowMessage('Can''t initialize playback device');
    Halt;
  end else
    labStatus.Text := 'Status: Initialized';
end;

procedure TAndroidModule1.btnPlay1Click(Sender: TObject);
begin
  PlayStream(urls[0]);
end;

procedure TAndroidModule1.btnPlay2Click(Sender: TObject);
begin
  PlayStream(urls[1]);
end;

procedure TAndroidModule1.btnStopClick(Sender: TObject);
begin
  BASS_StreamFree(FChan);
  labStatus.Text := 'Status: Stopped';
end;

procedure TAndroidModule1.PlayStream(AStreamURL: String);
begin
  BASS_StreamFree(FChan);

  FChan := BASS_StreamCreateURL(PChar(AStreamURL), 0, BASS_STREAM_BLOCK or BASS_STREAM_AUTOFREE, nil, nil);
  if (FChan = 0) then
    labStatus.Text := 'Status: Error ' + IntToStr(BASS_ErrorGetCode)
  else
  begin
    labStatus.Text := 'Status: Playing';
    BASS_ChannelPlay(FChan, False);
  end;
end;

procedure TAndroidModule1.AndroidModule1Close(Sender: TObject);
begin
  FreeBass;
end;

function TAndroidModule1.InitBass: Boolean;
begin
  Result := BASS_Init(-1, 44100, 0, nil, nil);
  if Result then
  begin
    BASS_SetConfig(BASS_CONFIG_NET_PLAYLIST, 1); // enable playlist processing
    BASS_SetConfig(BASS_CONFIG_NET_PREBUF, 0); // minimize automatic pre-buffering, so we can do it (and display it) instead
  end;
end;

procedure TAndroidModule1.FreeBass;
begin
  BASS_Stop;
  BASS_Free;
end;

end.
