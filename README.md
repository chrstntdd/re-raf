# re-raf

> A not so tiny function to control [requestAnimationFrame](https://developer.mozilla.org/en-US/docs/Web/API/window/requestAnimationFrame) - written in ReScript

This module was an exercise to explore writing [ReScript](https://rescript-lang.org/) so I could get familiar with binding to JavaScript globals, recursive functions, mutability, the Option type and the JavaScript output.

All credit for the API is owed to the fantastic [rafps](https://github.com/lukeed/rafps) by [Luke Edwards](https://github.com/lukeed).

## Usage

```re
// ReScript
let controller = Raf.rafLoop((. frame, pause) => {
  Js.log(frame)

  switch frame > 42 {
  | true => pause()
  | _ => ()
  }
}, 60)

controller.play()
```

```js
// JavaScript
let controller = Raf.rafLoop((frame, pause) => {
  console.log(frame)

  if (frame > 42) {
    pause()
  }
}, 60)

controller.play()
```

## Caveats

- ReScript doesn't seem to respect JS hoisting, so in order to support `pause` within the draw loop, the function is available as the second argument.
- Undoubtedly this version is heavier than the pure JS version. ReScript's mutability mechanics require object allocation which seem unnecessary since the usage here is limited to private state.
  - Anecdotally, in practice this hasn't been too much of a hinderance. I was still able to drive a smooth 60fps canvas animation no sweat.
