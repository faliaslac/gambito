import { TestBed } from '@angular/core/testing';

import { TPTIPRService } from './tptipr.service';

describe('TPTIPRService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: TPTIPRService = TestBed.get(TPTIPRService);
    expect(service).toBeTruthy();
  });
});
