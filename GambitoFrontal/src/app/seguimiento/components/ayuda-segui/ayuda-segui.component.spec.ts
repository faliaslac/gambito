import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AyudaSeguiComponent } from './ayuda-segui.component';

describe('AyudaSeguiComponent', () => {
  let component: AyudaSeguiComponent;
  let fixture: ComponentFixture<AyudaSeguiComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AyudaSeguiComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AyudaSeguiComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
