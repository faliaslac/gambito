import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { GetListTiprComponent } from './get-list-tipr.component';

describe('GetListTiprComponent', () => {
  let component: GetListTiprComponent;
  let fixture: ComponentFixture<GetListTiprComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ GetListTiprComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(GetListTiprComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
