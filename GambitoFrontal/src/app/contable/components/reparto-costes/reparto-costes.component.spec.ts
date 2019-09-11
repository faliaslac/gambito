import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { RepartoCostesComponent } from './reparto-costes.component';

describe('RepartoCostesComponent', () => {
  let component: RepartoCostesComponent;
  let fixture: ComponentFixture<RepartoCostesComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ RepartoCostesComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(RepartoCostesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
