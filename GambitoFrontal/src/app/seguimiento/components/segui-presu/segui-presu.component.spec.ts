import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { SeguiPresuComponent } from './segui-presu.component';

describe('SeguiPresuComponent', () => {
  let component: SeguiPresuComponent;
  let fixture: ComponentFixture<SeguiPresuComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ SeguiPresuComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(SeguiPresuComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
