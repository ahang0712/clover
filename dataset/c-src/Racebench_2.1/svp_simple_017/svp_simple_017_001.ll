; ModuleID = 'svp_simple_017_001.bc'
source_filename = "./svp_simple_017_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@svp_simple_017_001_global_var = common global i32 0, align 4
@svp_simple_017_001_local_array = common global [100 x i32] zeroinitializer, align 16

; Function Attrs: nounwind uwtable
define void @svp_simple_017_001_main() #0 !dbg !7 {
  %1 = alloca i32, align 4
  call void (...) @init(), !dbg !10
  %2 = bitcast i32* %1 to i8*, !dbg !11
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #3, !dbg !11
  store i32 0, i32* %1, align 4, !dbg !12, !tbaa !13
  store volatile i32 0, i32* @svp_simple_017_001_global_var, align 4, !dbg !17, !tbaa !13
  br label %3, !dbg !18

3:                                                ; preds = %12, %0
  %4 = load volatile i32, i32* @svp_simple_017_001_global_var, align 4, !dbg !19, !tbaa !13
  %5 = icmp slt i32 %4, 100, !dbg !20
  br i1 %5, label %6, label %15, !dbg !21

6:                                                ; preds = %3
  %7 = load i32, i32* %1, align 4, !dbg !22, !tbaa !13
  %8 = add nsw i32 %7, 1, !dbg !22
  store i32 %8, i32* %1, align 4, !dbg !22, !tbaa !13
  %9 = load volatile i32, i32* @svp_simple_017_001_global_var, align 4, !dbg !23, !tbaa !13
  %10 = sext i32 %9 to i64, !dbg !24
  %11 = getelementptr inbounds [100 x i32], [100 x i32]* @svp_simple_017_001_local_array, i64 0, i64 %10, !dbg !24
  store volatile i32 %7, i32* %11, align 4, !dbg !25, !tbaa !13
  br label %12, !dbg !26

12:                                               ; preds = %6
  %13 = load volatile i32, i32* @svp_simple_017_001_global_var, align 4, !dbg !27, !tbaa !13
  %14 = add nsw i32 %13, 1, !dbg !27
  store volatile i32 %14, i32* @svp_simple_017_001_global_var, align 4, !dbg !27, !tbaa !13
  br label %3, !dbg !21, !llvm.loop !28

15:                                               ; preds = %3
  %16 = bitcast i32* %1 to i8*, !dbg !29
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %16) #3, !dbg !29
  ret void, !dbg !29
}

declare void @init(...) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind uwtable
define void @svp_simple_017_001_isr_1() #0 !dbg !30 {
  call void (...) @idlerun(), !dbg !31
  store volatile i32 50, i32* @svp_simple_017_001_global_var, align 4, !dbg !32, !tbaa !13
  %1 = load volatile i32, i32* @svp_simple_017_001_global_var, align 4, !dbg !33, !tbaa !13
  %2 = sext i32 %1 to i64, !dbg !34
  %3 = getelementptr inbounds [100 x i32], [100 x i32]* @svp_simple_017_001_local_array, i64 0, i64 %2, !dbg !34
  store volatile i32 0, i32* %3, align 4, !dbg !35, !tbaa !13
  ret void, !dbg !36
}

declare void @idlerun(...) #1

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_017_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_017")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_017_001_main", scope: !8, file: !8, line: 10, type: !9, scopeLine: 10, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_017_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple_017")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 11, column: 3, scope: !7)
!11 = !DILocation(line: 12, column: 3, scope: !7)
!12 = !DILocation(line: 12, column: 7, scope: !7)
!13 = !{!14, !14, i64 0}
!14 = !{!"int", !15, i64 0}
!15 = !{!"omnipotent char", !16, i64 0}
!16 = !{!"Simple C/C++ TBAA"}
!17 = !DILocation(line: 14, column: 38, scope: !7)
!18 = !DILocation(line: 14, column: 8, scope: !7)
!19 = !DILocation(line: 14, column: 43, scope: !7)
!20 = !DILocation(line: 14, column: 73, scope: !7)
!21 = !DILocation(line: 14, column: 3, scope: !7)
!22 = !DILocation(line: 17, column: 70, scope: !7)
!23 = !DILocation(line: 17, column: 36, scope: !7)
!24 = !DILocation(line: 17, column: 5, scope: !7)
!25 = !DILocation(line: 17, column: 67, scope: !7)
!26 = !DILocation(line: 18, column: 3, scope: !7)
!27 = !DILocation(line: 15, column: 37, scope: !7)
!28 = distinct !{!28, !21, !26}
!29 = !DILocation(line: 19, column: 1, scope: !7)
!30 = distinct !DISubprogram(name: "svp_simple_017_001_isr_1", scope: !8, file: !8, line: 21, type: !9, scopeLine: 21, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!31 = !DILocation(line: 22, column: 3, scope: !30)
!32 = !DILocation(line: 24, column: 33, scope: !30)
!33 = !DILocation(line: 26, column: 34, scope: !30)
!34 = !DILocation(line: 26, column: 3, scope: !30)
!35 = !DILocation(line: 26, column: 65, scope: !30)
!36 = !DILocation(line: 27, column: 1, scope: !30)
