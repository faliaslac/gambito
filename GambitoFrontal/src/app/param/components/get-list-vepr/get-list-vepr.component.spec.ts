import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { GetListVEPRComponent } from './get-list-vepr.component';

describe('GetListVEPRComponent', () => {
  let component: GetListVEPRComponent;
  let fixture: ComponentFixture<GetListVEPRComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ GetListVEPRComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(GetListVEPRComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
