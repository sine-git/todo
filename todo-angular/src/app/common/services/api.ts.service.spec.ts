import { TestBed } from '@angular/core/testing';

import { ApiTsService } from './api.ts.service';

describe('ApiTsService', () => {
  let service: ApiTsService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(ApiTsService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
