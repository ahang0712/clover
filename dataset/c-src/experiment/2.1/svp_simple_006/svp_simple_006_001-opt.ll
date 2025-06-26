; ModuleID = 'svp_simple_006_001-opt.bc'
source_filename = "./svp_simple_006_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@flag = global i8 85, align 1
@svp_simple_006_001_global_var1 = common global i32 0, align 4
@svp_simple_006_001_global_var2 = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @svp_simple_006_001_main() #0 !dbg !7 {
  call void (...) @init(), !dbg !10
  br label %1, !dbg !11

1:                                                ; preds = %29, %0
  %.01 = phi i32 [ 0, %0 ], [ %30, %29 ], !dbg !12
  %2 = icmp slt i32 %.01, 5, !dbg !13
  br i1 %2, label %4, label %3, !dbg !14

3:                                                ; preds = %1
  br label %31

4:                                                ; preds = %1
  br label %5, !dbg !15

5:                                                ; preds = %26, %4
  %.02 = phi i32 [ 0, %4 ], [ %27, %26 ], !dbg !12
  %6 = icmp slt i32 %.01, 5, !dbg !16
  br i1 %6, label %8, label %7, !dbg !17

7:                                                ; preds = %5
  br label %28

8:                                                ; preds = %5
  %9 = icmp eq i32 %.01, %.02, !dbg !18
  br i1 %9, label %10, label %25, !dbg !19

10:                                               ; preds = %8
  %11 = icmp eq i32 %.01, 0, !dbg !20
  br i1 %11, label %12, label %14, !dbg !21

12:                                               ; preds = %10
  %13 = load volatile i32, i32* @svp_simple_006_001_global_var1, align 4, !dbg !22, !tbaa !23
  br label %24, !dbg !27

14:                                               ; preds = %10
  %15 = icmp eq i32 %.01, 4, !dbg !28
  br i1 %15, label %16, label %18, !dbg !29

16:                                               ; preds = %14
  %17 = load volatile i32, i32* @svp_simple_006_001_global_var1, align 4, !dbg !30, !tbaa !23
  br label %23, !dbg !31

18:                                               ; preds = %14
  %19 = icmp eq i32 %.01, 6, !dbg !32
  br i1 %19, label %20, label %22, !dbg !33

20:                                               ; preds = %18
  %21 = load volatile i32, i32* @svp_simple_006_001_global_var1, align 4, !dbg !34, !tbaa !23
  br label %22, !dbg !35

22:                                               ; preds = %20, %18
  br label %23

23:                                               ; preds = %22, %16
  br label %24

24:                                               ; preds = %23, %12
  br label %25, !dbg !36

25:                                               ; preds = %24, %8
  br label %26, !dbg !37

26:                                               ; preds = %25
  %27 = add nsw i32 %.02, 1, !dbg !38
  br label %5, !dbg !17, !llvm.loop !39

28:                                               ; preds = %7
  br label %29, !dbg !37

29:                                               ; preds = %28
  %30 = add nsw i32 %.01, 1, !dbg !40
  br label %1, !dbg !14, !llvm.loop !41

31:                                               ; preds = %3
  br label %32, !dbg !42

32:                                               ; preds = %49, %31
  %.03 = phi i32 [ 0, %31 ], [ %50, %49 ], !dbg !12
  %33 = icmp slt i32 %.03, 5, !dbg !43
  br i1 %33, label %35, label %34, !dbg !44

34:                                               ; preds = %32
  br label %51

35:                                               ; preds = %32
  br label %36, !dbg !45

36:                                               ; preds = %46, %35
  %.0 = phi i32 [ 0, %35 ], [ %47, %46 ], !dbg !12
  %37 = icmp slt i32 %.0, 5, !dbg !46
  br i1 %37, label %39, label %38, !dbg !47

38:                                               ; preds = %36
  br label %48

39:                                               ; preds = %36
  %40 = add nsw i32 %.03, %.0, !dbg !48
  %41 = icmp eq i32 %40, 6, !dbg !49
  br i1 %41, label %42, label %45, !dbg !50

42:                                               ; preds = %39
  %43 = icmp slt i32 %.03, %.0, !dbg !51
  br i1 %43, label %44, label %45, !dbg !52

44:                                               ; preds = %42
  store volatile i32 2, i32* @svp_simple_006_001_global_var2, align 4, !dbg !53, !tbaa !23
  br label %45, !dbg !54

45:                                               ; preds = %44, %42, %39
  br label %46, !dbg !55

46:                                               ; preds = %45
  %47 = add nsw i32 %.0, 1, !dbg !56
  br label %36, !dbg !47, !llvm.loop !57

48:                                               ; preds = %38
  br label %49, !dbg !55

49:                                               ; preds = %48
  %50 = add nsw i32 %.03, 1, !dbg !58
  br label %32, !dbg !44, !llvm.loop !59

51:                                               ; preds = %34
  ret void, !dbg !60
}

declare void @init(...) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind uwtable
define void @svp_simple_006_001_isr_1() #0 !dbg !61 {
  call void (...) @idlerun(), !dbg !62
  store volatile i32 0, i32* @svp_simple_006_001_global_var1, align 4, !dbg !63, !tbaa !23
  %1 = load volatile i32, i32* @svp_simple_006_001_global_var2, align 4, !dbg !64, !tbaa !23
  ret void, !dbg !65
}

declare void @idlerun(...) #1

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_006_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/experiment/2.1/svp_simple_006")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_006_001_main", scope: !8, file: !8, line: 25, type: !9, scopeLine: 25, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_006_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/experiment/2.1/svp_simple_006")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 26, column: 3, scope: !7)
!11 = !DILocation(line: 29, column: 8, scope: !7)
!12 = !DILocation(line: 0, scope: !7)
!13 = !DILocation(line: 29, column: 21, scope: !7)
!14 = !DILocation(line: 29, column: 3, scope: !7)
!15 = !DILocation(line: 30, column: 10, scope: !7)
!16 = !DILocation(line: 30, column: 23, scope: !7)
!17 = !DILocation(line: 30, column: 5, scope: !7)
!18 = !DILocation(line: 31, column: 13, scope: !7)
!19 = !DILocation(line: 31, column: 11, scope: !7)
!20 = !DILocation(line: 32, column: 15, scope: !7)
!21 = !DILocation(line: 32, column: 13, scope: !7)
!22 = !DILocation(line: 33, column: 21, scope: !7)
!23 = !{!24, !24, i64 0}
!24 = !{!"int", !25, i64 0}
!25 = !{!"omnipotent char", !26, i64 0}
!26 = !{!"Simple C/C++ TBAA"}
!27 = !DILocation(line: 33, column: 11, scope: !7)
!28 = !DILocation(line: 34, column: 20, scope: !7)
!29 = !DILocation(line: 34, column: 18, scope: !7)
!30 = !DILocation(line: 35, column: 21, scope: !7)
!31 = !DILocation(line: 35, column: 11, scope: !7)
!32 = !DILocation(line: 36, column: 20, scope: !7)
!33 = !DILocation(line: 36, column: 18, scope: !7)
!34 = !DILocation(line: 37, column: 21, scope: !7)
!35 = !DILocation(line: 37, column: 11, scope: !7)
!36 = !DILocation(line: 38, column: 7, scope: !7)
!37 = !DILocation(line: 39, column: 5, scope: !7)
!38 = !DILocation(line: 30, column: 29, scope: !7)
!39 = distinct !{!39, !17, !37}
!40 = !DILocation(line: 29, column: 27, scope: !7)
!41 = distinct !{!41, !14, !37}
!42 = !DILocation(line: 41, column: 8, scope: !7)
!43 = !DILocation(line: 41, column: 21, scope: !7)
!44 = !DILocation(line: 41, column: 3, scope: !7)
!45 = !DILocation(line: 42, column: 10, scope: !7)
!46 = !DILocation(line: 42, column: 23, scope: !7)
!47 = !DILocation(line: 42, column: 5, scope: !7)
!48 = !DILocation(line: 43, column: 15, scope: !7)
!49 = !DILocation(line: 43, column: 20, scope: !7)
!50 = !DILocation(line: 43, column: 26, scope: !7)
!51 = !DILocation(line: 43, column: 32, scope: !7)
!52 = !DILocation(line: 43, column: 11, scope: !7)
!53 = !DILocation(line: 44, column: 40, scope: !7)
!54 = !DILocation(line: 44, column: 9, scope: !7)
!55 = !DILocation(line: 45, column: 5, scope: !7)
!56 = !DILocation(line: 42, column: 29, scope: !7)
!57 = distinct !{!57, !47, !55}
!58 = !DILocation(line: 41, column: 27, scope: !7)
!59 = distinct !{!59, !44, !55}
!60 = !DILocation(line: 46, column: 1, scope: !7)
!61 = distinct !DISubprogram(name: "svp_simple_006_001_isr_1", scope: !8, file: !8, line: 48, type: !9, scopeLine: 48, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!62 = !DILocation(line: 50, column: 3, scope: !61)
!63 = !DILocation(line: 52, column: 34, scope: !61)
!64 = !DILocation(line: 53, column: 13, scope: !61)
!65 = !DILocation(line: 54, column: 1, scope: !61)
