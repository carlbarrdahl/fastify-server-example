// see https://github.com/sharenowTech/fastify-with-typescript-demo/blob/master/src/%40types/augmentation.ts
import * as fastify from "fastify";

declare module 'fastify' {
    interface FastifyInstance //<any>
    {
      // this should be same as the confKey in options
      config: 
        //env.properties
        /* */
      { 
        KEY1: string,
        KEY2: number
      };
        /* */
    }
  }

