import { TestBed } from '@angular/core/testing';

import { RepartoService } from './reparto.service';

describe('RepartoService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: RepartoService = TestBed.get(RepartoService);
    expect(service).toBeTruthy();
  });
});
