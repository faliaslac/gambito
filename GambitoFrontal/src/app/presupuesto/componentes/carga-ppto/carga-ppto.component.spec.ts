import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { CargaPptoComponent } from './carga-ppto.component';

describe('CargaPptoComponent', () => {
  let component: CargaPptoComponent;
  let fixture: ComponentFixture<CargaPptoComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ CargaPptoComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(CargaPptoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
