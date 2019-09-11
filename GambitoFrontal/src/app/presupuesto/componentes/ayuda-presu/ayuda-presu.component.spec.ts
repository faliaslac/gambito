import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AyudaPresuComponent } from './ayuda-presu.component';

describe('AyudaPresuComponent', () => {
  let component: AyudaPresuComponent;
  let fixture: ComponentFixture<AyudaPresuComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AyudaPresuComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AyudaPresuComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
