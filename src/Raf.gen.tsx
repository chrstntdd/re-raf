/* TypeScript file generated from Raf.res by genType. */
/* eslint-disable import/first */


// @ts-ignore: Implicit any on import
import * as Curry__Es6Import from 'rescript/lib/es6/curry.js';
const Curry: any = Curry__Es6Import;

// @ts-ignore: Implicit any on import
import * as RafBS__Es6Import from './Raf.bs';
const RafBS: any = RafBS__Es6Import;

// tslint:disable-next-line:interface-over-type-literal
export type controller = { readonly play: () => void; readonly pause: () => void };

export const rafLoop: (draw:((_1:number, _2:(() => void)) => void), fps:number) => controller = function (Arg1: any, Arg2: any) {
  const result = Curry._2(RafBS.rafLoop, Arg1, Arg2);
  return result
};
