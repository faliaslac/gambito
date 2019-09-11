import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AyudaContableComponent } from './ayuda-contable.component';

describe('AyudaContableComponent', () => {
  let component: AyudaContableComponent;
  let fixture: ComponentFixture<AyudaContableComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AyudaContableComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AyudaContableComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
