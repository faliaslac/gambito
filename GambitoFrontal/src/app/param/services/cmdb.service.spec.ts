import { TestBed } from '@angular/core/testing';

import { CmdbService } from './cmdb.service';

describe('CmdbService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: CmdbService = TestBed.get(CmdbService);
    expect(service).toBeTruthy();
  });
});
