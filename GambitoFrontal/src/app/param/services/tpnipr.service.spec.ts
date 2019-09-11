import { TestBed } from '@angular/core/testing';

import { TpniprService } from './tpnipr.service';

describe('TpniprService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: TpniprService = TestBed.get(TpniprService);
    expect(service).toBeTruthy();
  });
});
