import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { GetTIPRComponent } from './get-tipr.component';

describe('GetTIPRComponent', () => {
  let component: GetTIPRComponent;
  let fixture: ComponentFixture<GetTIPRComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ GetTIPRComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(GetTIPRComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
