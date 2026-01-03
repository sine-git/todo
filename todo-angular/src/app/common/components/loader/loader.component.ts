import { Component, inject } from '@angular/core';
import { MatProgressSpinnerModule } from '@angular/material/progress-spinner';
import { LoaderService } from 'src/app/common/services/loader.service';
@Component({
  selector: 'app-loader',
  templateUrl: './loader.component.html',
  styleUrls: ['./loader.component.scss'],
})
export class LoaderComponent {

  readonly loaderService = inject(LoaderService)
  load$ = this.loaderService.loader$;
}
