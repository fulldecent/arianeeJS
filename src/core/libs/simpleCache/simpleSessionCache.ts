import {singleton} from "tsyringe";

@singleton()
export class SimpleSessionCache {
  private cache = {};

  get = (key: string):Promise<string> => {
    if (!this.cache.hasOwnProperty(key)) {
      return Promise.reject("key");
    } else {
      return Promise.resolve(JSON.parse(this.cache[key]));
    }
  }

  set = (key: string, value: any):Promise<SimpleSessionCache> => {
    this.cache[key] = JSON.stringify(value);

    return Promise.resolve(this);
  }
}
