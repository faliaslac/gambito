import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { CierrePptoComponent } from './cierre-ppto.component';

describe('CierrePptoComponent', () => {
  let component: CierrePptoComponent;
  let fixture: ComponentFixture<CierrePptoComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ CierrePptoComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(CierrePptoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
