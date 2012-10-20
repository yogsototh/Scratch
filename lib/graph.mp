% solarized color scheme
color baseZeroThree, baseZeroTwo, baseZeroOne, baseZeroZero
      , baseZero, baseOne, baseTwo, baseThree, yellow, orange
      , red, magenta, violet, blue, cyan, green;
baseZeroThree  :=(0.0               ,0.168627450980392,0.211764705882353);
baseZeroTwo    :=(0.0274509803921569,0.211764705882353,0.258823529411765);
baseZeroOne    :=(0.345098039215686 ,0.431372549019608,0.458823529411765);
baseZeroZero   :=(0.396078431372549 ,0.482352941176471,0.513725490196078);
baseZero       :=(0.513725490196078 ,0.580392156862745,0.588235294117647);
baseOne        :=(0.576470588235294 ,0.631372549019608,0.631372549019608);
baseTwo        :=(0.933333333333333 ,0.909803921568627,0.835294117647059);
baseThree      :=(0.992156862745098 ,0.964705882352941,0.890196078431372);
yellow         :=(0.709803921568627 ,0.537254901960784,0.0);
orange         :=(0.796078431372549 ,0.294117647058824,0.0862745098039216);
red          :=(0.862745098039216 ,0.196078431372549,0.184313725490196);
magenta        :=(0.827450980392157 ,0.211764705882353,0.509803921568627);
violet         :=(0.423529411764706 ,0.443137254901961,0.768627450980392);
blue         :=(0.149019607843137 ,0.545098039215686,0.823529411764706);
cyan           :=(0.164705882352941 ,0.631372549019608,0.596078431372549);
green        :=(0.52156862745098  ,0.6              ,0.0);


vardef shorten(expr p,d) =
    path q,bcirc,ecirc;
    bcirc := fullcircle scaled d shifted point 0 of p;
    ecirc := fullcircle scaled d shifted point length(p) of p;
    q := p cutbefore bcirc cutafter ecirc;
    q
enddef;

%%%%%%%%%%%%%%%%%%%%
% Automata drawing %
%%%%%%%%%%%%%%%%%%%%
u:=.5cm; % unity
gu:=5u;  % distance between states

% -- Generic private functions

% return the edge between points A and B.
% out angle from A is inan
% in angle to B is outan
% nodesize is the size of the node
vardef _edgeFullParam(expr posA,posB,inan,outan,nodesize) =
    path sub;
    if (posA = posB):
        pair ba,ea,b;
        path circ,p;
        b :=posA shifted (0,nodesize);
        p:=posA{1,1}..b..{1,-1}cycle;
        circ:= fullcircle scaled nodesize shifted posA;
        ba = circ intersectionpoint (subpath (0,1) of p);
        ea = circ intersectionpoint (subpath (1,2) of p);
        sub:= ba{1,1}..b..{1,-1}ea;
    else:
        path s; s := posA {dir inan} .. {dir outan} posB ;
        pair bA;
        pair bA; bA = (fullcircle scaled nodesize shifted posA) intersectionpoint s;
        pair eB; eB = (fullcircle scaled nodesize shifted posB) intersectionpoint s;
        sub := bA {dir inan} .. {dir outan} eB ;
    fi
    sub
enddef;

% return a picture of the label l for edge e
vardef _edgelabel(expr e,l) =
    picture ret;
    pair mid;
    mid := point 1/2length(e) of e;
    numeric an;
    an := angle (direction 1/2length(e) of e);
    picture lab;
    pair height,width;
    lab:=thelabel(l,origin);
    height:=(0,ypart (ulcorner l - llcorner l));
    width:=(ypart (urcorner l - ulcorner l),0);
    if (an>-35) and (an<35):
        ret:=lab shifted height rotated an shifted mid;
    elseif (an>145) or (an<-145):
        ret:=thelabel(l,origin) shifted height rotated (an+180) shifted mid;
    elseif (an>75) and (an<120):
        ret:=lab shifted mid shifted -width;
    elseif (an>-120) and (an<-75):
        ret:=lab shifted mid shifted width;
    else:
        ret:=lab shifted mid shifted height;
    fi;
    ret
enddef;

% draw an edge
def _drawEdgeFullParam(expr posA,posB,l,inan,outan,nodesize) =
    path sub;
    picture lab;
    sub := _edgeFullParam(posA,posB,inan,outan,nodesize);
    drawarrow sub;
    draw _edgelabel(sub,l);
enddef;


% --- LABELED GRAPHS ---
% return the edge between points A and B.
% out angle from A is inan
vardef edgeAngle(expr posA,posB,an) =
    path sub;
    sub := _edgeFullParam(posA,posB,an,-an,1.2u);
    sub
enddef;
% return the direct edge between A and B
vardef edge(expr posA,posB) =
    numeric an;
    an := angle(posB-posA);
    path sub;
    sub := _edgeFullParam(posA,posB,an,an,1.2u);
    sub
enddef;

% --- UNLABELED GRAPHS ---
% return the edge between points A and B.
% out angle from A is inan
vardef nl_edgeAngle(expr posA,posB,an) =
    path sub;
    sub := _edgeFullParam(posA,posB,an,-an,6);
    sub
enddef;
% return the direct edge between A and B
vardef nl_edge(expr posA,posB) =
    numeric an;
    an := angle(posB-posA);
    path sub;
    sub := _edgeFullParam(posA,posB,an,an,6);
    sub
enddef;

def drawloop(expr a,b,l) =
    pair ba,ea;
    path circ,p,s;
    p:=a{1,1}..b..{1,-1}cycle;
    circ:= fullcircle scaled 6 shifted a;
    ba = circ intersectionpoint (subpath (0,1) of p);
    ea = circ intersectionpoint (subpath (1,2) of p);
    s:= ba{1,1}..b..{1,-1}ea;
    drawarrow s;
    label.top(l,b);
enddef;

def drawLoop(expr a,l) =
    pair b; b:=a shifted (0,u);
    pair ba,ea;
    path circ,p,s;
    p:=a{1,1}..b..{1,-1}cycle;
    circ:= fullcircle scaled 1.2u shifted a;
    ba = circ intersectionpoint (subpath (0,1) of p);
    ea = circ intersectionpoint (subpath (1,2) of p);
    s:= ba{1,1}..b..{1,-1}ea;
    drawarrow s;
    label.top(l,b);
enddef;
def drawstate(expr pos) =
    draw pos withpen pencircle scaled 4bp;
enddef;
def drawedgeWithDoubleAngle(expr posA,posB,l,inan,outan) =
    _drawEdgeFullParam(posA,posB,l,inan,outan,6);
enddef;

def drawedgeangle(expr posA,posB,l,an) =
    _drawEdgeFullParam(posA,posB,l,an,-an,6);
enddef;
def drawedge(expr posA,posB,l) =
    numeric an;
    an=angle(posB-posA);
    _drawEdgeFullParam(posA,posB,l,an,an,6);
enddef;

def drawState(expr pos,l) =
    label(l,pos);
    draw fullcircle scaled u shifted pos;
enddef;

def drawEdgeWithDoubleAngle(expr posA,posB,l,inan,outan) =
    _drawEdgeFullParam(posA,posB,l,inan,outan,1.2u);
enddef;
def drawEdgeWithAngle(expr posA,posB,l,an) =
    drawEdgeWithDoubleAngle(posA,posB,l,an,-an);
enddef;
def drawEdge(expr posA,posB,l) =
    numeric an;
    if (posA = posB):
        an := 0;
    else:
        an=angle(posB-posA);
    fi
    drawEdgeWithDoubleAngle(posA,posB,l,an,an);
enddef;

prologues:=3;

