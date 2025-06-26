; ModuleID = 'svp_simple_643_001-opt.bc'
source_filename = "./svp_simple_643_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@g = global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @reach_error() #0 !dbg !7 {
  %1 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0), !dbg !10
  ret void, !dbg !11
}

declare i32 @assert(...) #1

; Function Attrs: nounwind uwtable
define void @__VERIFIER_assert(i32 %0) #0 !dbg !12 {
  %2 = icmp ne i32 %0, 0, !dbg !13
  br i1 %2, label %6, label %3, !dbg !14

3:                                                ; preds = %1
  br label %4, !dbg !15

4:                                                ; preds = %3
  %5 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #4, !dbg !16
  call void @abort() #5, !dbg !18
  unreachable, !dbg !18

6:                                                ; preds = %1
  ret void, !dbg !19
}

; Function Attrs: noreturn
declare void @abort() #2

; Function Attrs: nounwind uwtable
define i32 @pqueue_init() #0 !dbg !20 {
  store i32 0, i32* @g, align 4, !dbg !21, !tbaa !22
  ret i32 0, !dbg !26
}

; Function Attrs: nounwind uwtable
define i32 @pqueue_put() #0 !dbg !27 {
  %1 = load i32, i32* @g, align 4, !dbg !28, !tbaa !22
  %2 = icmp slt i32 %1, 1000, !dbg !29
  br i1 %2, label %3, label %6, !dbg !28

3:                                                ; preds = %0
  %4 = load i32, i32* @g, align 4, !dbg !30, !tbaa !22
  %5 = add nsw i32 %4, 1, !dbg !31
  store i32 %5, i32* @g, align 4, !dbg !32, !tbaa !22
  br label %6, !dbg !33

6:                                                ; preds = %3, %0
  ret i32 1, !dbg !34
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #3

; Function Attrs: nounwind uwtable
define i32 @pqueue_get() #0 !dbg !35 {
  %1 = load i32, i32* @g, align 4, !dbg !36, !tbaa !22
  %2 = icmp eq i32 %1, 0, !dbg !37
  %3 = zext i1 %2 to i32, !dbg !37
  br i1 %2, label %__VERIFIER_assert.exit, label %4, !dbg !38

4:                                                ; preds = %0
  %5 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #4, !dbg !40
  call void @abort() #6, !dbg !42
  unreachable, !dbg !42

__VERIFIER_assert.exit:                           ; preds = %0
  %6 = load i32, i32* @g, align 4, !dbg !43, !tbaa !22
  %7 = icmp ne i32 %6, 0, !dbg !44
  %8 = zext i1 %7 to i32, !dbg !44
  br i1 %7, label %__VERIFIER_assert.exit1, label %9, !dbg !45

9:                                                ; preds = %__VERIFIER_assert.exit
  %10 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #4, !dbg !47
  call void @abort() #6, !dbg !49
  unreachable, !dbg !49

__VERIFIER_assert.exit1:                          ; preds = %__VERIFIER_assert.exit
  %11 = load i32, i32* @g, align 4, !dbg !50, !tbaa !22
  %12 = icmp sgt i32 %11, 0, !dbg !51
  br i1 %12, label %13, label %16, !dbg !50

13:                                               ; preds = %__VERIFIER_assert.exit1
  %14 = load i32, i32* @g, align 4, !dbg !52, !tbaa !22
  %15 = sub nsw i32 %14, 1, !dbg !53
  store i32 %15, i32* @g, align 4, !dbg !54, !tbaa !22
  br label %16, !dbg !55

16:                                               ; preds = %13, %__VERIFIER_assert.exit1
  %.0 = phi i32 [ 1, %13 ], [ 0, %__VERIFIER_assert.exit1 ], !dbg !56
  ret i32 %.0, !dbg !57
}

; Function Attrs: nounwind uwtable
define i32 @isr_pqueue_get() #0 !dbg !58 {
  %1 = load i32, i32* @g, align 4, !dbg !59, !tbaa !22
  %2 = icmp eq i32 %1, 0, !dbg !60
  %3 = zext i1 %2 to i32, !dbg !60
  br i1 %2, label %__VERIFIER_assert.exit, label %4, !dbg !61

4:                                                ; preds = %0
  %5 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #4, !dbg !63
  call void @abort() #6, !dbg !65
  unreachable, !dbg !65

__VERIFIER_assert.exit:                           ; preds = %0
  %6 = load i32, i32* @g, align 4, !dbg !66, !tbaa !22
  %7 = icmp ne i32 %6, 0, !dbg !67
  %8 = zext i1 %7 to i32, !dbg !67
  br i1 %7, label %__VERIFIER_assert.exit1, label %9, !dbg !68

9:                                                ; preds = %__VERIFIER_assert.exit
  %10 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #4, !dbg !70
  call void @abort() #6, !dbg !72
  unreachable, !dbg !72

__VERIFIER_assert.exit1:                          ; preds = %__VERIFIER_assert.exit
  %11 = load i32, i32* @g, align 4, !dbg !73, !tbaa !22
  %12 = icmp sgt i32 %11, 0, !dbg !74
  br i1 %12, label %13, label %16, !dbg !73

13:                                               ; preds = %__VERIFIER_assert.exit1
  %14 = load i32, i32* @g, align 4, !dbg !75, !tbaa !22
  %15 = add nsw i32 %14, -1, !dbg !75
  store i32 %15, i32* @g, align 4, !dbg !75, !tbaa !22
  br label %16, !dbg !76

16:                                               ; preds = %13, %__VERIFIER_assert.exit1
  %.0 = phi i32 [ 1, %13 ], [ 0, %__VERIFIER_assert.exit1 ], !dbg !77
  ret i32 %.0, !dbg !78
}

; Function Attrs: nounwind uwtable
define void @svp_simple_643_001_isr1(i8* %0) #0 !dbg !79 {
  %2 = load i32, i32* @g, align 4, !dbg !80, !tbaa !22
  %3 = icmp eq i32 %2, 0, !dbg !82
  %4 = zext i1 %3 to i32, !dbg !82
  br i1 %3, label %__VERIFIER_assert.exit.i, label %5, !dbg !83

5:                                                ; preds = %1
  %6 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #4, !dbg !85
  call void @abort() #6, !dbg !87
  unreachable, !dbg !87

__VERIFIER_assert.exit.i:                         ; preds = %1
  %7 = load i32, i32* @g, align 4, !dbg !88, !tbaa !22
  %8 = icmp ne i32 %7, 0, !dbg !89
  %9 = zext i1 %8 to i32, !dbg !89
  br i1 %8, label %__VERIFIER_assert.exit1.i, label %10, !dbg !90

10:                                               ; preds = %__VERIFIER_assert.exit.i
  %11 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #4, !dbg !92
  call void @abort() #6, !dbg !94
  unreachable, !dbg !94

__VERIFIER_assert.exit1.i:                        ; preds = %__VERIFIER_assert.exit.i
  %12 = load i32, i32* @g, align 4, !dbg !95, !tbaa !22
  %13 = icmp sgt i32 %12, 0, !dbg !96
  br i1 %13, label %14, label %isr_pqueue_get.exit, !dbg !95

14:                                               ; preds = %__VERIFIER_assert.exit1.i
  %15 = load i32, i32* @g, align 4, !dbg !97, !tbaa !22
  %16 = add nsw i32 %15, -1, !dbg !97
  store i32 %16, i32* @g, align 4, !dbg !97, !tbaa !22
  br label %isr_pqueue_get.exit, !dbg !98

isr_pqueue_get.exit:                              ; preds = %__VERIFIER_assert.exit1.i, %14
  %.0.i = phi i32 [ 1, %14 ], [ 0, %__VERIFIER_assert.exit1.i ], !dbg !99
  ret void, !dbg !100
}

; Function Attrs: nounwind uwtable
define i32 @svp_simple_643_001_main(i32 %0, i8** %1) #0 !dbg !101 {
  store i32 0, i32* @g, align 4, !dbg !102, !tbaa !22
  br label %3, !dbg !104

3:                                                ; preds = %12, %2
  %.0 = phi i32 [ 1, %2 ], [ %13, %12 ], !dbg !105
  %4 = icmp slt i32 %.0, 5, !dbg !106
  br i1 %4, label %6, label %5, !dbg !107

5:                                                ; preds = %3
  br label %14

6:                                                ; preds = %3
  %7 = load i32, i32* @g, align 4, !dbg !108, !tbaa !22
  %8 = icmp slt i32 %7, 1000, !dbg !110
  br i1 %8, label %9, label %pqueue_put.exit, !dbg !108

9:                                                ; preds = %6
  %10 = load i32, i32* @g, align 4, !dbg !111, !tbaa !22
  %11 = add nsw i32 %10, 1, !dbg !112
  store i32 %11, i32* @g, align 4, !dbg !113, !tbaa !22
  br label %pqueue_put.exit, !dbg !114

pqueue_put.exit:                                  ; preds = %6, %9
  br label %12, !dbg !115

12:                                               ; preds = %pqueue_put.exit
  %13 = add nsw i32 %.0, 1, !dbg !116
  br label %3, !dbg !107, !llvm.loop !117

14:                                               ; preds = %5
  ret i32 0, !dbg !118
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { nounwind }
attributes #5 = { noreturn }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_643_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "reach_error", scope: !8, file: !8, line: 2, type: !9, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_643_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/goblint-regression")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 2, column: 22, scope: !7)
!11 = !DILocation(line: 2, column: 33, scope: !7)
!12 = distinct !DISubprogram(name: "__VERIFIER_assert", scope: !8, file: !8, line: 3, type: !9, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!13 = !DILocation(line: 5, column: 8, scope: !12)
!14 = !DILocation(line: 5, column: 7, scope: !12)
!15 = !DILocation(line: 6, column: 3, scope: !12)
!16 = !DILocation(line: 2, column: 22, scope: !7, inlinedAt: !17)
!17 = distinct !DILocation(line: 9, column: 5, scope: !12)
!18 = !DILocation(line: 10, column: 5, scope: !12)
!19 = !DILocation(line: 13, column: 1, scope: !12)
!20 = distinct !DISubprogram(name: "pqueue_init", scope: !8, file: !8, line: 17, type: !9, scopeLine: 18, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!21 = !DILocation(line: 19, column: 5, scope: !20)
!22 = !{!23, !23, i64 0}
!23 = !{!"int", !24, i64 0}
!24 = !{!"omnipotent char", !25, i64 0}
!25 = !{!"Simple C/C++ TBAA"}
!26 = !DILocation(line: 20, column: 3, scope: !20)
!27 = distinct !DISubprogram(name: "pqueue_put", scope: !8, file: !8, line: 23, type: !9, scopeLine: 24, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!28 = !DILocation(line: 26, column: 7, scope: !27)
!29 = !DILocation(line: 26, column: 9, scope: !27)
!30 = !DILocation(line: 28, column: 15, scope: !27)
!31 = !DILocation(line: 28, column: 17, scope: !27)
!32 = !DILocation(line: 29, column: 7, scope: !27)
!33 = !DILocation(line: 31, column: 3, scope: !27)
!34 = !DILocation(line: 33, column: 3, scope: !27)
!35 = distinct !DISubprogram(name: "pqueue_get", scope: !8, file: !8, line: 36, type: !9, scopeLine: 37, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!36 = !DILocation(line: 40, column: 21, scope: !35)
!37 = !DILocation(line: 40, column: 23, scope: !35)
!38 = !DILocation(line: 5, column: 7, scope: !12, inlinedAt: !39)
!39 = distinct !DILocation(line: 40, column: 3, scope: !35)
!40 = !DILocation(line: 2, column: 22, scope: !7, inlinedAt: !41)
!41 = distinct !DILocation(line: 9, column: 5, scope: !12, inlinedAt: !39)
!42 = !DILocation(line: 10, column: 5, scope: !12, inlinedAt: !39)
!43 = !DILocation(line: 42, column: 21, scope: !35)
!44 = !DILocation(line: 42, column: 23, scope: !35)
!45 = !DILocation(line: 5, column: 7, scope: !12, inlinedAt: !46)
!46 = distinct !DILocation(line: 42, column: 3, scope: !35)
!47 = !DILocation(line: 2, column: 22, scope: !7, inlinedAt: !48)
!48 = distinct !DILocation(line: 9, column: 5, scope: !12, inlinedAt: !46)
!49 = !DILocation(line: 10, column: 5, scope: !12, inlinedAt: !46)
!50 = !DILocation(line: 43, column: 7, scope: !35)
!51 = !DILocation(line: 43, column: 9, scope: !35)
!52 = !DILocation(line: 45, column: 15, scope: !35)
!53 = !DILocation(line: 45, column: 17, scope: !35)
!54 = !DILocation(line: 46, column: 7, scope: !35)
!55 = !DILocation(line: 49, column: 3, scope: !35)
!56 = !DILocation(line: 0, scope: !35)
!57 = !DILocation(line: 51, column: 3, scope: !35)
!58 = distinct !DISubprogram(name: "isr_pqueue_get", scope: !8, file: !8, line: 54, type: !9, scopeLine: 55, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!59 = !DILocation(line: 58, column: 21, scope: !58)
!60 = !DILocation(line: 58, column: 23, scope: !58)
!61 = !DILocation(line: 5, column: 7, scope: !12, inlinedAt: !62)
!62 = distinct !DILocation(line: 58, column: 3, scope: !58)
!63 = !DILocation(line: 2, column: 22, scope: !7, inlinedAt: !64)
!64 = distinct !DILocation(line: 9, column: 5, scope: !12, inlinedAt: !62)
!65 = !DILocation(line: 10, column: 5, scope: !12, inlinedAt: !62)
!66 = !DILocation(line: 60, column: 21, scope: !58)
!67 = !DILocation(line: 60, column: 23, scope: !58)
!68 = !DILocation(line: 5, column: 7, scope: !12, inlinedAt: !69)
!69 = distinct !DILocation(line: 60, column: 3, scope: !58)
!70 = !DILocation(line: 2, column: 22, scope: !7, inlinedAt: !71)
!71 = distinct !DILocation(line: 9, column: 5, scope: !12, inlinedAt: !69)
!72 = !DILocation(line: 10, column: 5, scope: !12, inlinedAt: !69)
!73 = !DILocation(line: 61, column: 7, scope: !58)
!74 = !DILocation(line: 61, column: 9, scope: !58)
!75 = !DILocation(line: 63, column: 6, scope: !58)
!76 = !DILocation(line: 65, column: 3, scope: !58)
!77 = !DILocation(line: 0, scope: !58)
!78 = !DILocation(line: 67, column: 3, scope: !58)
!79 = distinct !DISubprogram(name: "svp_simple_643_001_isr1", scope: !8, file: !8, line: 70, type: !9, scopeLine: 71, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!80 = !DILocation(line: 58, column: 21, scope: !58, inlinedAt: !81)
!81 = distinct !DILocation(line: 73, column: 3, scope: !79)
!82 = !DILocation(line: 58, column: 23, scope: !58, inlinedAt: !81)
!83 = !DILocation(line: 5, column: 7, scope: !12, inlinedAt: !84)
!84 = distinct !DILocation(line: 58, column: 3, scope: !58, inlinedAt: !81)
!85 = !DILocation(line: 2, column: 22, scope: !7, inlinedAt: !86)
!86 = distinct !DILocation(line: 9, column: 5, scope: !12, inlinedAt: !84)
!87 = !DILocation(line: 10, column: 5, scope: !12, inlinedAt: !84)
!88 = !DILocation(line: 60, column: 21, scope: !58, inlinedAt: !81)
!89 = !DILocation(line: 60, column: 23, scope: !58, inlinedAt: !81)
!90 = !DILocation(line: 5, column: 7, scope: !12, inlinedAt: !91)
!91 = distinct !DILocation(line: 60, column: 3, scope: !58, inlinedAt: !81)
!92 = !DILocation(line: 2, column: 22, scope: !7, inlinedAt: !93)
!93 = distinct !DILocation(line: 9, column: 5, scope: !12, inlinedAt: !91)
!94 = !DILocation(line: 10, column: 5, scope: !12, inlinedAt: !91)
!95 = !DILocation(line: 61, column: 7, scope: !58, inlinedAt: !81)
!96 = !DILocation(line: 61, column: 9, scope: !58, inlinedAt: !81)
!97 = !DILocation(line: 63, column: 6, scope: !58, inlinedAt: !81)
!98 = !DILocation(line: 65, column: 3, scope: !58, inlinedAt: !81)
!99 = !DILocation(line: 0, scope: !58, inlinedAt: !81)
!100 = !DILocation(line: 74, column: 1, scope: !79)
!101 = distinct !DISubprogram(name: "svp_simple_643_001_main", scope: !8, file: !8, line: 76, type: !9, scopeLine: 77, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!102 = !DILocation(line: 19, column: 5, scope: !20, inlinedAt: !103)
!103 = distinct !DILocation(line: 79, column: 3, scope: !101)
!104 = !DILocation(line: 82, column: 8, scope: !101)
!105 = !DILocation(line: 0, scope: !101)
!106 = !DILocation(line: 82, column: 21, scope: !101)
!107 = !DILocation(line: 82, column: 3, scope: !101)
!108 = !DILocation(line: 26, column: 7, scope: !27, inlinedAt: !109)
!109 = distinct !DILocation(line: 84, column: 5, scope: !101)
!110 = !DILocation(line: 26, column: 9, scope: !27, inlinedAt: !109)
!111 = !DILocation(line: 28, column: 15, scope: !27, inlinedAt: !109)
!112 = !DILocation(line: 28, column: 17, scope: !27, inlinedAt: !109)
!113 = !DILocation(line: 29, column: 7, scope: !27, inlinedAt: !109)
!114 = !DILocation(line: 31, column: 3, scope: !27, inlinedAt: !109)
!115 = !DILocation(line: 85, column: 3, scope: !101)
!116 = !DILocation(line: 82, column: 27, scope: !101)
!117 = distinct !{!117, !107, !115}
!118 = !DILocation(line: 86, column: 3, scope: !101)
