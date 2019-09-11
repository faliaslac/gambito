import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AyudaParamComponent } from './ayuda-param.component';

describe('AyudaParamComponent', () => {
  let component: AyudaParamComponent;
  let fixture: ComponentFixture<AyudaParamComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AyudaParamComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AyudaParamComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
