; ModuleID = 'svp_simple_003_001-opt.bc'
source_filename = "./svp_simple_003_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@svp_simple_003_001_global_flag = global i32 0, align 4
@svp_simple_003_001_global_flag1 = global i32 0, align 4
@svp_simple_003_001_global_var2 = common global i32 0, align 4
@svp_simple_003_001_global_var1 = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @svp_simple_003_001_main() #0 !dbg !7 {
  call void (...) @init(), !dbg !10
  call void (...) @idlerun(), !dbg !11
  call void @disable_isr(i32 1), !dbg !12
  call void @disable_isr(i32 2), !dbg !13
  br label %1, !dbg !14

1:                                                ; preds = %9, %0
  %.03 = phi i32 [ 0, %0 ], [ %10, %9 ], !dbg !15
  %2 = icmp slt i32 %.03, 10000, !dbg !16
  br i1 %2, label %4, label %3, !dbg !17

3:                                                ; preds = %1
  br label %11

4:                                                ; preds = %1
  %5 = icmp eq i32 %.03, 9999, !dbg !18
  br i1 %5, label %6, label %8, !dbg !19

6:                                                ; preds = %4
  %7 = load volatile i32, i32* @svp_simple_003_001_global_var2, align 4, !dbg !20, !tbaa !21
  br label %8, !dbg !25

8:                                                ; preds = %6, %4
  br label %9, !dbg !26

9:                                                ; preds = %8
  %10 = add nsw i32 %.03, 1, !dbg !27
  br label %1, !dbg !17, !llvm.loop !28

11:                                               ; preds = %3
  br label %12, !dbg !29

12:                                               ; preds = %20, %11
  %.02 = phi i32 [ 10000, %11 ], [ %21, %20 ], !dbg !15
  %13 = icmp sgt i32 %.02, 0, !dbg !30
  br i1 %13, label %15, label %14, !dbg !31

14:                                               ; preds = %12
  br label %22

15:                                               ; preds = %12
  %16 = icmp eq i32 %.02, 9999, !dbg !32
  br i1 %16, label %17, label %19, !dbg !33

17:                                               ; preds = %15
  %18 = load volatile i32, i32* @svp_simple_003_001_global_var2, align 4, !dbg !34, !tbaa !21
  br label %19, !dbg !35

19:                                               ; preds = %17, %15
  br label %20, !dbg !36

20:                                               ; preds = %19
  %21 = add nsw i32 %.02, -1, !dbg !37
  br label %12, !dbg !31, !llvm.loop !38

22:                                               ; preds = %14
  call void @enable_isr(i32 1), !dbg !39
  br label %23, !dbg !40

23:                                               ; preds = %31, %22
  %.01 = phi i32 [ 0, %22 ], [ %32, %31 ], !dbg !15
  %24 = icmp slt i32 %.01, 10000, !dbg !41
  br i1 %24, label %26, label %25, !dbg !42

25:                                               ; preds = %23
  br label %33

26:                                               ; preds = %23
  %27 = icmp eq i32 %.01, 9999, !dbg !43
  br i1 %27, label %28, label %30, !dbg !44

28:                                               ; preds = %26
  %29 = load volatile i32, i32* @svp_simple_003_001_global_var1, align 4, !dbg !45, !tbaa !21
  br label %30, !dbg !46

30:                                               ; preds = %28, %26
  br label %31, !dbg !47

31:                                               ; preds = %30
  %32 = add nsw i32 %.01, 1, !dbg !48
  br label %23, !dbg !42, !llvm.loop !49

33:                                               ; preds = %25
  br label %34, !dbg !50

34:                                               ; preds = %42, %33
  %.0 = phi i32 [ 10000, %33 ], [ %43, %42 ], !dbg !15
  %35 = icmp sgt i32 %.0, 0, !dbg !51
  br i1 %35, label %37, label %36, !dbg !52

36:                                               ; preds = %34
  br label %44

37:                                               ; preds = %34
  %38 = icmp eq i32 %.0, 9999, !dbg !53
  br i1 %38, label %39, label %41, !dbg !54

39:                                               ; preds = %37
  %40 = load volatile i32, i32* @svp_simple_003_001_global_var1, align 4, !dbg !55, !tbaa !21
  br label %41, !dbg !56

41:                                               ; preds = %39, %37
  br label %42, !dbg !57

42:                                               ; preds = %41
  %43 = add nsw i32 %.0, -1, !dbg !58
  br label %34, !dbg !52, !llvm.loop !59

44:                                               ; preds = %36
  ret void, !dbg !60
}

declare void @init(...) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

declare void @idlerun(...) #1

declare void @disable_isr(i32) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

declare void @enable_isr(i32) #1

; Function Attrs: nounwind uwtable
define void @svp_simple_003_001_isr_1() #0 !dbg !61 {
  call void @enable_isr(i32 2), !dbg !62
  store volatile i32 999, i32* @svp_simple_003_001_global_var2, align 4, !dbg !63, !tbaa !21
  %1 = load volatile i32, i32* @svp_simple_003_001_global_flag, align 4, !dbg !64, !tbaa !21
  %2 = icmp eq i32 %1, 1, !dbg !65
  br i1 %2, label %3, label %4, !dbg !64

3:                                                ; preds = %0
  store volatile i32 999, i32* @svp_simple_003_001_global_var1, align 4, !dbg !66, !tbaa !21
  br label %9, !dbg !67

4:                                                ; preds = %0
  %5 = load volatile i32, i32* @svp_simple_003_001_global_flag1, align 4, !dbg !68, !tbaa !21
  %6 = icmp eq i32 %5, 2, !dbg !69
  br i1 %6, label %7, label %8, !dbg !68

7:                                                ; preds = %4
  store volatile i32 888, i32* @svp_simple_003_001_global_var1, align 4, !dbg !70, !tbaa !21
  br label %8, !dbg !71

8:                                                ; preds = %7, %4
  br label %9

9:                                                ; preds = %8, %3
  ret void, !dbg !72
}

; Function Attrs: nounwind uwtable
define void @svp_simple_003_001_isr_2() #0 !dbg !73 {
  call void (...) @idlerun(), !dbg !74
  store volatile i32 1, i32* @svp_simple_003_001_global_flag, align 4, !dbg !75, !tbaa !21
  ret void, !dbg !76
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_003_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_003")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_003_001_main", scope: !8, file: !8, line: 12, type: !9, scopeLine: 12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_003_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_003")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 13, column: 3, scope: !7)
!11 = !DILocation(line: 16, column: 3, scope: !7)
!12 = !DILocation(line: 18, column: 3, scope: !7)
!13 = !DILocation(line: 19, column: 3, scope: !7)
!14 = !DILocation(line: 21, column: 8, scope: !7)
!15 = !DILocation(line: 0, scope: !7)
!16 = !DILocation(line: 21, column: 21, scope: !7)
!17 = !DILocation(line: 21, column: 3, scope: !7)
!18 = !DILocation(line: 22, column: 11, scope: !7)
!19 = !DILocation(line: 22, column: 9, scope: !7)
!20 = !DILocation(line: 23, column: 17, scope: !7)
!21 = !{!22, !22, i64 0}
!22 = !{!"int", !23, i64 0}
!23 = !{!"omnipotent char", !24, i64 0}
!24 = !{!"Simple C/C++ TBAA"}
!25 = !DILocation(line: 24, column: 5, scope: !7)
!26 = !DILocation(line: 25, column: 3, scope: !7)
!27 = !DILocation(line: 21, column: 36, scope: !7)
!28 = distinct !{!28, !17, !26}
!29 = !DILocation(line: 26, column: 8, scope: !7)
!30 = !DILocation(line: 26, column: 30, scope: !7)
!31 = !DILocation(line: 26, column: 3, scope: !7)
!32 = !DILocation(line: 27, column: 11, scope: !7)
!33 = !DILocation(line: 27, column: 9, scope: !7)
!34 = !DILocation(line: 28, column: 17, scope: !7)
!35 = !DILocation(line: 29, column: 5, scope: !7)
!36 = !DILocation(line: 30, column: 3, scope: !7)
!37 = !DILocation(line: 26, column: 36, scope: !7)
!38 = distinct !{!38, !31, !36}
!39 = !DILocation(line: 32, column: 3, scope: !7)
!40 = !DILocation(line: 33, column: 8, scope: !7)
!41 = !DILocation(line: 33, column: 21, scope: !7)
!42 = !DILocation(line: 33, column: 3, scope: !7)
!43 = !DILocation(line: 34, column: 11, scope: !7)
!44 = !DILocation(line: 34, column: 9, scope: !7)
!45 = !DILocation(line: 35, column: 17, scope: !7)
!46 = !DILocation(line: 36, column: 5, scope: !7)
!47 = !DILocation(line: 37, column: 3, scope: !7)
!48 = !DILocation(line: 33, column: 36, scope: !7)
!49 = distinct !{!49, !42, !47}
!50 = !DILocation(line: 38, column: 8, scope: !7)
!51 = !DILocation(line: 38, column: 30, scope: !7)
!52 = !DILocation(line: 38, column: 3, scope: !7)
!53 = !DILocation(line: 39, column: 11, scope: !7)
!54 = !DILocation(line: 39, column: 9, scope: !7)
!55 = !DILocation(line: 40, column: 17, scope: !7)
!56 = !DILocation(line: 41, column: 5, scope: !7)
!57 = !DILocation(line: 42, column: 3, scope: !7)
!58 = !DILocation(line: 38, column: 36, scope: !7)
!59 = distinct !{!59, !52, !57}
!60 = !DILocation(line: 43, column: 1, scope: !7)
!61 = distinct !DISubprogram(name: "svp_simple_003_001_isr_1", scope: !8, file: !8, line: 45, type: !9, scopeLine: 45, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!62 = !DILocation(line: 46, column: 3, scope: !61)
!63 = !DILocation(line: 47, column: 34, scope: !61)
!64 = !DILocation(line: 49, column: 7, scope: !61)
!65 = !DILocation(line: 49, column: 38, scope: !61)
!66 = !DILocation(line: 50, column: 36, scope: !61)
!67 = !DILocation(line: 51, column: 3, scope: !61)
!68 = !DILocation(line: 51, column: 14, scope: !61)
!69 = !DILocation(line: 51, column: 46, scope: !61)
!70 = !DILocation(line: 52, column: 36, scope: !61)
!71 = !DILocation(line: 53, column: 3, scope: !61)
!72 = !DILocation(line: 54, column: 1, scope: !61)
!73 = distinct !DISubprogram(name: "svp_simple_003_001_isr_2", scope: !8, file: !8, line: 56, type: !9, scopeLine: 56, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!74 = !DILocation(line: 57, column: 3, scope: !73)
!75 = !DILocation(line: 58, column: 34, scope: !73)
!76 = !DILocation(line: 59, column: 1, scope: !73)
