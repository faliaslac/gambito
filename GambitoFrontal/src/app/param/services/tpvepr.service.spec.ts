import { TestBed } from '@angular/core/testing';

import { TpveprService } from './tpvepr.service';

describe('TpveprService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: TpveprService = TestBed.get(TpveprService);
    expect(service).toBeTruthy();
  });
});
