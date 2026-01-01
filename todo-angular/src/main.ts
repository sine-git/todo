import { platformBrowserDynamic } from '@angular/platform-browser-dynamic';

import { AppModule } from './app/app.module';


platformBrowserDynamic().bootstrapModule(AppModule, { providers: [provideHttpClient()] })
  .catch(err => console.error(err));
function provideHttpClient(): import("@angular/core").StaticProvider {
  throw new Error('Function not implemented.');
}

