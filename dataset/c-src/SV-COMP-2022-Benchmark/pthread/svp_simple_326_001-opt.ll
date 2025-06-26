; ModuleID = 'svp_simple_326_001-opt.bc'
source_filename = "./svp_simple_326_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@num = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @reach_error() #0 !dbg !7 {
  %1 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0), !dbg !10
  ret void, !dbg !11
}

declare i32 @assert(...) #1

; Function Attrs: nounwind uwtable
define void @svp_simple_326_001_isr_1(i8* %0) #0 !dbg !12 {
  br label %2, !dbg !13

2:                                                ; preds = %5, %1
  %3 = load i32, i32* @num, align 4, !dbg !14, !tbaa !15
  %4 = icmp sgt i32 %3, 0, !dbg !19
  br i1 %4, label %5, label %8, !dbg !13

5:                                                ; preds = %2
  %6 = load i32, i32* @num, align 4, !dbg !20, !tbaa !15
  %7 = sub nsw i32 %6, 1, !dbg !21
  store i32 %7, i32* @num, align 4, !dbg !22, !tbaa !15
  br label %2, !dbg !13, !llvm.loop !23

8:                                                ; preds = %2
  ret void, !dbg !25
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind uwtable
define void @svp_simple_326_001_isr_2(i8* %0) #0 !dbg !26 {
  br label %2, !dbg !27

2:                                                ; preds = %5, %1
  %3 = load i32, i32* @num, align 4, !dbg !28, !tbaa !15
  %4 = icmp eq i32 %3, 0, !dbg !29
  br i1 %4, label %5, label %8, !dbg !27

5:                                                ; preds = %2
  %6 = load i32, i32* @num, align 4, !dbg !30, !tbaa !15
  %7 = sub nsw i32 %6, 1, !dbg !31
  store i32 %7, i32* @num, align 4, !dbg !32, !tbaa !15
  br label %2, !dbg !27, !llvm.loop !33

8:                                                ; preds = %2
  ret void, !dbg !35
}

; Function Attrs: nounwind uwtable
define i32 @svp_simple_326_001_main() #0 !dbg !36 {
  store i32 1, i32* @num, align 4, !dbg !37, !tbaa !15
  %1 = load i32, i32* @num, align 4, !dbg !38, !tbaa !15
  %2 = icmp ne i32 %1, 1, !dbg !39
  br i1 %2, label %3, label %6, !dbg !38

3:                                                ; preds = %0
  br label %4, !dbg !40

4:                                                ; preds = %3
  %5 = call i32 (i32, ...) bitcast (i32 (...)* @assert to i32 (i32, ...)*)(i32 0) #4, !dbg !41
  call void @abort() #5, !dbg !43
  unreachable, !dbg !43

6:                                                ; preds = %0
  ret i32 0, !dbg !44
}

; Function Attrs: noreturn
declare void @abort() #3

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { noreturn "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { noreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_326_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/pthread")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "reach_error", scope: !8, file: !8, line: 2, type: !9, scopeLine: 2, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_326_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/pthread")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 2, column: 22, scope: !7)
!11 = !DILocation(line: 2, column: 33, scope: !7)
!12 = distinct !DISubprogram(name: "svp_simple_326_001_isr_1", scope: !8, file: !8, line: 7, type: !9, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!13 = !DILocation(line: 10, column: 3, scope: !12)
!14 = !DILocation(line: 10, column: 10, scope: !12)
!15 = !{!16, !16, i64 0}
!16 = !{!"int", !17, i64 0}
!17 = !{!"omnipotent char", !18, i64 0}
!18 = !{!"Simple C/C++ TBAA"}
!19 = !DILocation(line: 10, column: 14, scope: !12)
!20 = !DILocation(line: 11, column: 15, scope: !12)
!21 = !DILocation(line: 11, column: 18, scope: !12)
!22 = !DILocation(line: 12, column: 8, scope: !12)
!23 = distinct !{!23, !13, !24}
!24 = !DILocation(line: 13, column: 3, scope: !12)
!25 = !DILocation(line: 14, column: 1, scope: !12)
!26 = distinct !DISubprogram(name: "svp_simple_326_001_isr_2", scope: !8, file: !8, line: 17, type: !9, scopeLine: 18, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!27 = !DILocation(line: 20, column: 3, scope: !26)
!28 = !DILocation(line: 20, column: 10, scope: !26)
!29 = !DILocation(line: 20, column: 14, scope: !26)
!30 = !DILocation(line: 21, column: 15, scope: !26)
!31 = !DILocation(line: 21, column: 18, scope: !26)
!32 = !DILocation(line: 22, column: 8, scope: !26)
!33 = distinct !{!33, !27, !34}
!34 = !DILocation(line: 23, column: 3, scope: !26)
!35 = !DILocation(line: 25, column: 1, scope: !26)
!36 = distinct !DISubprogram(name: "svp_simple_326_001_main", scope: !8, file: !8, line: 28, type: !9, scopeLine: 29, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!37 = !DILocation(line: 31, column: 7, scope: !36)
!38 = !DILocation(line: 33, column: 7, scope: !36)
!39 = !DILocation(line: 33, column: 10, scope: !36)
!40 = !DILocation(line: 34, column: 3, scope: !36)
!41 = !DILocation(line: 2, column: 22, scope: !7, inlinedAt: !42)
!42 = distinct !DILocation(line: 35, column: 13, scope: !36)
!43 = !DILocation(line: 35, column: 27, scope: !36)
!44 = !DILocation(line: 38, column: 3, scope: !36)
