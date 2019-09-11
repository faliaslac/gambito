import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { GetListPaprComponent } from './get-list-papr.component';

describe('GetListPaprComponent', () => {
  let component: GetListPaprComponent;
  let fixture: ComponentFixture<GetListPaprComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ GetListPaprComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(GetListPaprComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
