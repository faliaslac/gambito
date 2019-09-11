import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { GetListProveedorComponent } from './get-list-proveedor.component';

describe('GetListProveedorComponent', () => {
  let component: GetListProveedorComponent;
  let fixture: ComponentFixture<GetListProveedorComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ GetListProveedorComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(GetListProveedorComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
