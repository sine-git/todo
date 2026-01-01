import { platformBrowserDynamic } from '@angular/platform-browser-dynamic';

import { AppModule } from './app/app.module';
import { provideHttpClient } from '@angular/common/http';


platformBrowserDynamic().bootstrapModule(AppModule, { providers: [] })
  .catch(err => console.error(err));


