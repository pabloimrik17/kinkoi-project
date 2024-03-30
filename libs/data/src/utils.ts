import { domainMainInit } from "@kinkoi/domain";

export class DataMain {
  constructor() {
    console.log('DataMain');
  }
}

export const dataMainInit = (): DataMain => {
    domainMainInit()
    return new DataMain()
}
