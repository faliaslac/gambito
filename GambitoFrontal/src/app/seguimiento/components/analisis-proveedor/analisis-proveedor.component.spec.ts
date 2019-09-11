import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AnalisisProveedorComponent } from './analisis-proveedor.component';

describe('AnalisisProveedorComponent', () => {
  let component: AnalisisProveedorComponent;
  let fixture: ComponentFixture<AnalisisProveedorComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AnalisisProveedorComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AnalisisProveedorComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
