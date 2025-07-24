; ModuleID = '/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_005/svp_simple_005_001.ll'
source_filename = "./svp_simple_005_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@svp_simple_005_001_global_condition = global i32 0, align 4
@svp_simple_005_001_global_var = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @svp_simple_005_001_main() local_unnamed_addr #0 !dbg !7 {
  tail call void (...) @init() #2, !dbg !10
  br label %.preheader, !dbg !11

.preheader:                                       ; preds = %5, %0
  %.01012 = phi i32 [ 0, %0 ], [ %6, %5 ]
  %1 = icmp eq i32 %.01012, 9999, !dbg !12
  br label %7, !dbg !13

2:                                                ; preds = %5
  %3 = load volatile i32, i32* @svp_simple_005_001_global_condition, align 4, !dbg !14, !tbaa !15
  %4 = icmp eq i32 %3, 1, !dbg !19
  br i1 %4, label %10, label %11, !dbg !14

5:                                                ; preds = %12
  %6 = add nuw nsw i32 %.01012, 1, !dbg !20
  %exitcond13 = icmp eq i32 %6, 10000, !dbg !21
  br i1 %exitcond13, label %2, label %.preheader, !dbg !11, !llvm.loop !22

7:                                                ; preds = %12, %.preheader
  %.011 = phi i32 [ 0, %.preheader ], [ %13, %12 ]
  %8 = icmp eq i32 %.011, 1000, !dbg !24
  %or.cond = and i1 %1, %8, !dbg !25
  br i1 %or.cond, label %9, label %12, !dbg !25

9:                                                ; preds = %7
  store volatile i32 1, i32* @svp_simple_005_001_global_var, align 4, !dbg !26, !tbaa !15
  br label %12, !dbg !27

10:                                               ; preds = %2
  store volatile i32 9, i32* @svp_simple_005_001_global_var, align 4, !dbg !28, !tbaa !15
  br label %11, !dbg !29

11:                                               ; preds = %10, %2
  store volatile i32 5, i32* @svp_simple_005_001_global_var, align 4, !dbg !30, !tbaa !15
  ret void, !dbg !31

12:                                               ; preds = %9, %7
  %13 = add nuw nsw i32 %.011, 4, !dbg !32
  %exitcond.3 = icmp eq i32 %13, 10000, !dbg !33
  br i1 %exitcond.3, label %5, label %7, !dbg !13, !llvm.loop !34
}

declare void @init(...) local_unnamed_addr #1

; Function Attrs: nounwind uwtable
define void @svp_simple_005_001_isr_1() local_unnamed_addr #0 !dbg !36 {
  tail call void (...) @idlerun() #2, !dbg !37
  %1 = load volatile i32, i32* @svp_simple_005_001_global_var, align 4, !dbg !38, !tbaa !15
  ret void, !dbg !39
}

declare void @idlerun(...) local_unnamed_addr #1

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_005_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_005")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_005_001_main", scope: !8, file: !8, line: 12, type: !9, scopeLine: 12, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_005_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_005")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 13, column: 3, scope: !7)
!11 = !DILocation(line: 14, column: 3, scope: !7)
!12 = !DILocation(line: 0, scope: !7)
!13 = !DILocation(line: 15, column: 5, scope: !7)
!14 = !DILocation(line: 21, column: 7, scope: !7)
!15 = !{!16, !16, i64 0}
!16 = !{!"int", !17, i64 0}
!17 = !{!"omnipotent char", !18, i64 0}
!18 = !{!"Simple C/C++ TBAA"}
!19 = !DILocation(line: 21, column: 43, scope: !7)
!20 = !DILocation(line: 14, column: 36, scope: !7)
!21 = !DILocation(line: 14, column: 21, scope: !7)
!22 = distinct !{!22, !11, !23}
!23 = !DILocation(line: 19, column: 3, scope: !7)
!24 = !DILocation(line: 16, column: 32, scope: !7)
!25 = !DILocation(line: 16, column: 26, scope: !7)
!26 = !DILocation(line: 17, column: 39, scope: !7)
!27 = !DILocation(line: 17, column: 9, scope: !7)
!28 = !DILocation(line: 23, column: 35, scope: !7)
!29 = !DILocation(line: 24, column: 3, scope: !7)
!30 = !DILocation(line: 25, column: 33, scope: !7)
!31 = !DILocation(line: 26, column: 1, scope: !7)
!32 = !DILocation(line: 15, column: 38, scope: !7)
!33 = !DILocation(line: 15, column: 23, scope: !7)
!34 = distinct !{!34, !13, !35}
!35 = !DILocation(line: 18, column: 5, scope: !7)
!36 = distinct !DISubprogram(name: "svp_simple_005_001_isr_1", scope: !8, file: !8, line: 28, type: !9, scopeLine: 28, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!37 = !DILocation(line: 29, column: 3, scope: !36)
!38 = !DILocation(line: 31, column: 12, scope: !36)
!39 = !DILocation(line: 32, column: 1, scope: !36)
