 # Simplex RPG Engine 3
 ## Currently under early development, please use v2
 
 <a href="https://github.com/lofcz/SimplexRpgEngine/tree/SimplexRpgEngine2">Simplex RPG Engine 2</a>


### Why I've started working on v3
There are plenty of reasons behind this. But these are the main ones:

- We relied on proprietary software
- GML sucks
- Underlaying layer was a blackbox

### Aim of v3

- Engine build on top of MonoGame FW
- Tiled serves as primary room editor
- Implement as much of GMS pipeline into C# as possible
- Upgrade outdated concepts of GMS

### Status

**Done**
- Sprite
- Font

**WIP**
- Object (GameObject)
- Events

**TBD**
- Shader
- Timeline
- Path
- Room

### Object events
Events are aiming to imitate GMS native events while introducing some newcomers and discarding obsolete overheat. 

- OnSetup - Use to toggle predefined GameObject behavior / custom plugins
- OnCreate - Equal to create
- OnStep - Equal to step
- OnDraw - Equal to draw
- OnEditorDraw - Occurs when object is drawn in room editor

