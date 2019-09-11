import { TestBed } from '@angular/core/testing';

import { TppaprService } from './tppapr.service';

describe('TppaprService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: TppaprService = TestBed.get(TppaprService);
    expect(service).toBeTruthy();
  });
});
